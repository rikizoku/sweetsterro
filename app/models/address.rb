class Address < ApplicationRecord

   validates :post_code,  presence: true
   validates :last_name,  presence: true
   validates :first_name, presence: true
   validates :address, presence: true

   belongs_to :customer

end
