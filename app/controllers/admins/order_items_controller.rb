class Admins::OrderItemsController < ApplicationController

 before_action :authenticate_admin!

 def update
    order_item = OrderItem.find_by(params[:id])
    order_item.update(order_item_params)
    redirect_to admins_path
 end

 def order_item_params
  params.require(:order_item).permit(:order_id, :item_id, :production_status)
 end

end
