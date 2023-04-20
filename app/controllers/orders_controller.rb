class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.order_number = SecureRandom.alphanumeric(8).upcase
    if @order.save
      flash[:success] = "The order has been submitted"
    end
  end
  
  def show
    @order = current_user.orders
  end

  def search
    @order = Order.find_by(order_number: params[:order_number])
    if @order
      render "track"
    else
      flash[:alert] = "Order not found"
    end
  end

  def accept 
    @order = Order.find(params[:id])
    if current_user.currier? && @order.order_status == "Pending"
      @order.update_attribute(:order_status, "Accepted")
      @order.update_attribute(:user_id, current_user.id)
      redirect_to acceptedorder_path, notice: "Order accepted"
    else
      redirect_to currierorder_path, alert: "Unable to accept order"
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:order_number, :start_destination, :final_destination, :quantity, :goods_type, :additional_details, :user_id, :order_status)
  end
end



