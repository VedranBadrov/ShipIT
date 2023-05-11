require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "should set default order status to Pending" do
    order = Order.new
    assert order.Pending?
  end

  test "should calculate cost correctly" do
    order = Order.new(quantity: 10, weight: 5, distance: 100)
    assert_equal 10 + 5*2 + 100*0.1, order.costcalculator
  end

  test "should set default order status before validation if new record" do
    order = Order.new
    assert order.Pending?
    order.save
    assert order.Pending?
  end
end
