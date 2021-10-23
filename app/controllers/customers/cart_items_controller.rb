class Customers::CartItemsController < ApplicationController
before_action :authenticate_customer!

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = current_customer.cart_items
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy
    redirect_to cart_items_path
  end




private

def cart_item_params
  params.require(:cart_item).permit(:item_id, :quantity, :customer_id)
end

end
