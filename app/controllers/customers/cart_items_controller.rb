class Customers::CartItemsController < ApplicationController
before_action :authenticate_customer!
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

def cart_items_params
  params.require(:cart_item).permit(:item_id, :quantity)
end

end
