class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :payment_method
      t.string :address
      t.string :postal_code
      t.string :name
      t.integer :total_payment
      t.integer :status
      t.integer :postage
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :customer_id

      t.timestamps
    end
  end
end
