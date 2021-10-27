class Customers::ItemsController < ApplicationController

    before_action :authenticate_customer!,except: [:index,:show]

def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
end

def index
    @items = Item.all
    @item_page = Item.page(params[:page]).reverse_order
    @genres = Genre.all
end

def genreitem
    @genre = Genre.find(params[:id])
    @items = @genre.items
    @genres = Genre.all
    @item_page = Item.page(params[:page]).reverse_order
end

end