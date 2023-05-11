require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test 'should set the user_id to the current user id' do
    sign_in users(:one)
    post orders_url, params: { order: { receiver_email: 'jackthereceiver@test.com' } }
    assert_equal assigns(:order).user_id, users(:one).id
  end
end
