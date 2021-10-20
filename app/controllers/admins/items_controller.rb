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
      redirect_to admin_item(@item.id)
    end
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

  private
  def item_params
    params.require(:item).permit(:item, :image, :item_explanation, :price, :sale_status, :created_at, :updated_at)
  end

end
