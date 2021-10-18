class Admin::ItemsController < ApplicationController

  def show
    @item = item.find_by(id: params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item(@item.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:item, :image, :item_explanation, :price, :sale_status, :created_at, :updated_at)
  end

end
