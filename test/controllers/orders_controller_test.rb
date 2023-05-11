require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest 
    fixtures :users

    test "should accept order" do
        order = orders(:one)
        currier = users(:currier)
        sign_in currier
    
        patch accept_order_path(order)
    
        assert_equal "Accepted", order.reload.order_status
        assert_equal currier.id, order.reload.user_id
        assert_redirected_to acceptedorder_path
        assert_equal "Order accepted", flash[:notice]
      end
    
      test "should not accept order if not currier" do
        order = orders(:one)
        user = users(:user)
        sign_in user
    
        patch accept_order_path(order)
    
        assert_not_equal "Accepted", order.reload.order_status
        assert_not_equal user.id, order.reload.user_id
        assert_redirected_to currierorder_path
        assert_equal "Unable to accept order", flash[:alert]
      end
    
      test "should not accept order if already accepted" do
        order = orders(:one)
        currier = users(:currier)
        order.update_attribute(:order_status, "Accepted")
        sign_in currier
    
        patch accept_order_path(order)
    
        assert_not_equal "InProgress", order.reload.order_status
        assert_redirected_to currierorder_path
        assert_equal "Unable to accept order", flash[:alert]
      end
end
