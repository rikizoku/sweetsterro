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

enum payment_method: {クレジットカード: 0, 銀行振込: 1 }

  after_update do
    if self.order_status == "入金確認"
      self.order_details.each {|order_detail|
      order_item.update(sale_status: "製作待ち")}
    end
  end

end
