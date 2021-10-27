class Admins::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
  end

  def show
    @order = Order.find(params[:id])
    @orders = @order.order_items
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admins_order_path(order)
  end

  private

  def order_params
     params.require(:order).permit(:address, :payment_method, :postage, :total_payment, :status)
  end

end
