class Admins::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
  end

  def show
    @order = Order.find(params[:id])
    @orders = @order.order_items
    #@oder_items = @order_items(params[:id])
    #@total = @cart_items.inject(0) { |sum, item| sum + item.cart_items_price }
  end

  def update
    order_item = Order.find(params[:id])
    order_item.update(order_item_params)
    redirect_to admins_orders_path(order.order_id)
  end

  private

  def order_params
     params.require(:order).permit(:customer_id, :address, :payment_method, :postage, :total_payment, :status)
  end

  def order_item_params
    params.require(:order_item).permit(:status)
  end

end
