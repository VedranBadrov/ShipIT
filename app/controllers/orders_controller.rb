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
    #@orders = Order.all
    @orders = current_user.orders
  end

  #def currierupdate
    #if current_user.curier? && @order.currierupdate(order_params)
      #"Order update successful"
    #else
      #"Order update not successful"
   #end
  #end

  #def adminupdate 
    #if current_user.admin? && @order.adminupdate(order_params)
      #"Order update successful"
    #else 
      #"Order update not successful"
    #end
  #end

  def search
    @order = Order.find_by(order_number: params[:order_number])
    if @order
      render "track"
    else
      flash[:alert] = "Order not found"
      redirect_to root_path
    end
  end

  #before_action :authorize_curier_or_admin, only: [:update]


  private

  def order_params
    params.require(:order).permit(:order_number, :start_destination, :final_destination, :quantity, :goods_type, :additional_details, :user_id)
  end

  #def authorize_curier_or_admin
    #unless current_user.curier? || current_user.admin?
      #redirect_to orders_path, alert: "You are not authorized to perform this action."
    #end
  #end
end



