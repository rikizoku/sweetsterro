class Customers::OrdersController < ApplicationController
  def confirm
    @order_items= OrderItem.all
  end

end
