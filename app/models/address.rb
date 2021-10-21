class Address < ApplicationRecord
  
  belongs_to :customer
  
  validates :postal_code, presence: true, format: { with: /^\d{7}$ }　# 郵便番号（ハイフンなし7桁）
  validates :last_name,  presence: true
   validates :first_name, presence: true
   validates :address, presence: true

end