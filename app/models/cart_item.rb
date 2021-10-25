class CartItem < ApplicationRecord
 belongs_to :item
 belongs_to :customer

  def cart_items_price
  (item.price*1.1) * quantity
  end

end