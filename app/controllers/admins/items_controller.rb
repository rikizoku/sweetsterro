class Admins::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
    @item_page = Item.page(params[:page]).reverse_order
  end


  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_item_path(@item.id)
    else
      render "edit"
    end
  end

  def new
   @item = Item.new
   @genres = Genre.all
  end

  def create
   @item = Item.new(item_params)
   @item.save
   redirect_to admins_item_path(@item)
 
  end

  private
  def item_params

    params.require(:item).permit(:genre_id, :item, :image, :item_explanation, :price, :sale_status, :created_at, :updated_at)

  end

end
