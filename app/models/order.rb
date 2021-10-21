class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  enum status: {
    waiting: 0,
    paid_up: 1,
    making: 2,
    preparing: 3,
    shipped: 4
  }

  enum payment_method: [:クレジットカード, :銀行振込]

end
