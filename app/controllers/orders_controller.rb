class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.order_number = SecureRandom.alphanumeric(8).upcase
    if @order.save
      flash[:success] = "The has been created"
      redirect_to confirmation_order_path(@order)
    else
      render :new
    end
  end

  def confirmation 
    @order = Order.find(params[:id])
  end
  
  def show
    @order = current_user.orders
    if params[:from_search]
      @order = Order.find(params[:id])
    end
  end

  def search
    @order = Order.find_by(order_number: params[:order_number])
    if @order.nil?
      flash.now[:alert] = "Order not found"
    else  
      redirect_to order_path(@order)
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

  def manage 
    @order = Order.find(params[:id])
    render 'currier/manageorder'
  end

  def begin
    @order = Order.find(params[:id])
    if current_user.currier? && @order.order_status == "Accepted"
      @order.update_attribute(:order_status, 'InProgress')
      redirect_to acceptedorder_path, notice: 'Order is now in progress.'
    end
  end

  def cancel
    @order = Order.find(params[:id])
    @order.update_attribute(:order_status, 'Canceled')
    @order.update_attribute(:cancellation_reason, params[:cancellation_reason])
    redirect_to currierhistory_path, notice: 'Order has been canceled.'
  end

  def complete
    @order = Order.find(params[:id])
    @order.update_attribute(:order_status, 'Completed')
    redirect_to currierhistory_path, notice: 'Order has been completed.'
  end

  def history
    @completed_orders = Order.where(order_status: [:Completed, :Canceled])
  end

  def costcalculator
    @order = Order.new(order_params)
    @cost = @order.quantity * @order.weight * @order.distance
    render 'costcalculator'
  end
  
  private

  def order_params
    params.require(:order).permit(
      :order_number,
      :start_destination,
      :start_destination_address_line_1,
      :start_destination_address_line_2,
      :start_destination_city,
      :start_destination_postcode,
      :final_destination,
      :final_destination_address_line_1,
      :final_destination_address_line_2,
      :final_destination_city,
      :final_destination_postcode,
      :quantity,
      :goods_type,
      :additional_details,
      :user_id,
      :order_status,
      :cancellation_reason,
      :weight,
      :distance
    )
  end
end



