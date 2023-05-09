require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should search order by order number" do
    get search_order_url, params: { order_number: @order.order_number }
    assert_redirected_to order_path(@order)
  end

  test "should not find order if order number is invalid" do
    get search_order_url, params: { order_number: 'invalid' }
    assert_response :success
    assert_select 'div.alert', 'Order not found'
  end

  test "should get receiver's orders" do
    receiver = users(:two)
    get receiver_order_url, params: { receiver_email: receiver.email }
    assert_response :success
    assert_select 'h1', "Orders for #{receiver.email}"
  end

  test "should not allow non-currier user to accept order" do
    user = users(:two)
    sign_in user
    post accept_order_url(@order)
    assert_redirected_to currierorder_path
    assert_equal 'Unable to accept order', flash[:alert]
  end

  test "should allow currier user to accept order" do
    user = users(:currier)
    sign_in user
    post accept_order_url(@order)
    assert_redirected_to acceptedorder_path
    assert_equal 'Order accepted', flash[:notice]
  end

  test "should allow currier user to manage order" do
    user = users(:currier)
    sign_in user
    get manage_order_url(@order)
    assert_response :success
    assert_select 'h1', 'Manage Order'
  end

  test "should allow currier user to begin order" do
    user = users(:currier)
    sign_in user
    post begin_order_url(@order)
    assert_redirected_to acceptedorder_path
    assert_equal 'Order is now in progress.', flash[:notice]
  end

  test "should allow user to cancel order" do
    patch cancel_order_url(@order), params: { cancellation_reason: 'test' }
    assert_redirected_to currierhistory_path
    assert_equal 'Order has been canceled.', flash[:notice]
  end

  test "should allow user to complete order" do
    patch complete_order_url(@order)
    assert_redirected_to currierhistory_path
    assert_equal 'Order has been completed.', flash[:notice]
  end
end
