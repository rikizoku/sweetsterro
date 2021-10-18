class Admin::ItemsController < ApplicationController



  def show
    #@items = Item.find(params[:id]) #<!--管理者用商品詳細ページへ商品情報を渡す為のもの{Tsuyoshi}-->
  end

  def index
    @items = Item.all
    @item_page = Item.page(params[:page]).reverse_order
  end

private
  def item_params
    params.require(:item).permit(:item, :name, :price)
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
