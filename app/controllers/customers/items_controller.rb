class Customers::ItemsController < ApplicationController

def show
    @item = Item.find(params[:id])
    @cart_item = current_customer.cart_items.new
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