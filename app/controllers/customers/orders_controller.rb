class Customers::OrdersController < ApplicationController
  def confirm
    @item = Item.find(params[:item_id])
    @order = @item.order.new(order_params)
  end

end
