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

end
