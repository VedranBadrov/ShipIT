require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
    test 'should calculate cost' do
        post '/orders/costcalculator', params: { weight: 10, distance: 20, quantity: 3 }
        assert_response :success
        assert_select '.cost-info', text: /The cost of your order is \u20AC\d+\.\d{2}/, count: 1
      end
    end