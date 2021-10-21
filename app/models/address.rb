class Address < ApplicationRecord

  belongs_to :customer

  # 郵便番号（ハイフンなし7桁）
  validates :postal_code,  presence: true
  validates :name, presence: true
  validates :address, presence: true

end