class Customers::OrdersController < ApplicationController

  def new
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new
    render :new if @order.invalid?
  end

  def show
    @order = Order.find(params[:id])
  end


end
