class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.order_number = SecureRandom.alphanumeric(8).upcase
    if @order.save
      flash[:notice] = "The order has been submitted"
    else
      render :new
    end
  end
  
  def show
    #@orders = Order.find_by(user_id: params[:user_id])
    @orders = current_user.orders
    #@orders = Order.all
  end

  private

  def order_params
    params.require(:order).permit(:order_number, :start_destination, :final_destination, :quantity, :goods_type, :additional_details, :user_id)
  end
end



