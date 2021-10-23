class Customers::ItemsController < ApplicationController

def show
    @item = Item.find(params[:id])
end

def index
    @items = Item.all
    @item_page = Item.page(params[:page]).reverse_order
end

end

