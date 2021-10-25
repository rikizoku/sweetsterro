class Admins::OrderItemsController < ApplicationController

  before_action :authenticate_admin!

   def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admins_ordesr_path(order)
   end

end
