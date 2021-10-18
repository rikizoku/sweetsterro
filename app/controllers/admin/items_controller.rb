class Admin::ItemsController < ApplicationController



  def show
    @item = item.find_by(id: params[:id])
  end

  def index
    @items = Item.all
    @item_page = Item.page(params[:page]).reverse_order
  end

private
  def item_params
    params.require(:item).permit(:item, :name, :price)
  end

end
