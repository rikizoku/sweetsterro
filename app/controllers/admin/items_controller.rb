class Admin::ItemsController < ApplicationController

  def show
    @item = item.find(params[:id])
  end

  def new
   @item = Item.new
  end

  def create
   @item = Item.new(item_params)
   if @item.save
     redirect_to admin_item_path(@item), notice: "You have created item successfully."
   else
     render 'new'
   end
  end

  def item_params
    params.require(:item).permit(:image, :item, :price, :sale_status)

  end


end
