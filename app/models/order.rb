class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  enum payment_method: [:クレジットカード, :銀行振込]


end
