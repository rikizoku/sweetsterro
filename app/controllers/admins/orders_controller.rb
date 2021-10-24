class Admins::OrdersController < ApplicationController

  def index
  end

  def show
    #@order = Order.find(params[:id])
    #@oder_items = @order_items(params[:id])
    #@total = @cart_items.inject(0) { |sum, item| sum + item.cart_items_price }
  end

  private

  def order_params
     params.require(:order).permit(:customer_id, :address, :payment_method, :postage, :total_payment, :status)
  end

end
