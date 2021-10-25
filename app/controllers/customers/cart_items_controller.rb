class Customers::CartItemsController < ApplicationController
before_action :authenticate_customer!

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
    if cart_item.item_id == @cart_item.item_id
      new_quantity = cart_item.quantity + @cart_item.quantity
      cart_item.update_attribute(:quantity, new_quantity)
      @cart_item.delete
    end
    end
    if
      @cart_item.save
      redirect_to cart_items_path
    else
      @item = Item.find(cart_item_params[:item_id])
      render "customers/items/show"
    end
  end

  def index
    @cart_items = current_customer.cart_items
  end

  def destroy_all

    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end




private

def cart_item_params
  params.require(:cart_item).permit(:item_id, :quantity, :customer_id)
end

end
