class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  attachment :image
  has_many :orders

  validates :item, presence: true
  validates :item_explanation, presence: true
  validates :price, presence: true

end
