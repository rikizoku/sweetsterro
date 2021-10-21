class Customers::OrdersController < ApplicationController
  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    render :new if @order.invalid?
  end

  private

  def order_params
  params.require(:order).permit(:name, :address, :total_payment)
  end


end
