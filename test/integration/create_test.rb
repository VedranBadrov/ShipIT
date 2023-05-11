require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  test 'should create order with valid params' do
    # Create a user
    user = User.create(email: 'test@example.com', password: 'password')
    sign_in user

    assert_difference('Order.count', 1) do
      post orders_path, params: {
        order: {
          start_destination_address_line_1: '123 Main St',
          start_destination_address_line_2: 'Apt 4',
          start_destination_city: 'New York',
          start_destination_postcode: '10001',
          final_destination_address_line_1: '456 Elm St',
          final_destination_address_line_2: '',
          final_destination_city: 'Los Angeles',
          final_destination_postcode: '90001',
          quantity: 3,
          goods_type: 'Books',
          additional_details: 'Handle with care',
          receiver_email: 'receiver@example.com',
          pickup_datetime: Time.now + 2.hours
        }
      }
    end
    
    assert_redirected_to confirmation_path(Order.last)
    assert_equal 'Order created!', flash[:success]
  end
end

  