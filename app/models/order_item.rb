class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum production_status: {
    着手不可:0,
    製作待ち:1,
    製作中:2,
    製作完了:3
  }

  after_update do
    order_items = self.order.order_items
    if order_items.any? {|order_item| order_item.production_status == "製作中"} == true #製作ステータスが1つでも製作中なら
      self.order.update(status: "製作中") #注文ステータスを製作中へ変更
    elsif order_items.all? {|order_item| order_item.production_status == "製作完了"} == true #製作ステータスが全て製作完了なら
      self.order.update(status: "発送準備中") #注文ステータスを発送準備中へ変更
    end
  end

end
