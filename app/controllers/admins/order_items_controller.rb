class Admins::OrderItemsController < ApplicationController

 before_action :authenticate_admin!

 def update
  order = Order.find(params[:id])
  order.update(order_params)
  redirect_to admins_ordesr_path(order)
 end

 def order_item_params
  params.require(:order_item).permit(:order_id, :item_id, :production_status)
 end

end
