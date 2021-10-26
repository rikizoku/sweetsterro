class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  enum status: {
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送準備中: 3,
    発送済み: 4
  }

enum payment_method: {クレジットカード: 0, 銀行振込: 1 }

  after_update do
    if self.order_status == "入金確認"
      self.order_details.each {|order_detail|
      order_item.update(sale_status: "製作待ち")}
    end
  end

  def cart_items_price
   (item.price*1.1) * quantity
  end

end
