class Address < ApplicationRecord
  
  belongs_to :customer
  
  validates :postal_code, presence: true, format: { with: /^\d{7}$ }　# 郵便番号（ハイフンなし7桁）
end
