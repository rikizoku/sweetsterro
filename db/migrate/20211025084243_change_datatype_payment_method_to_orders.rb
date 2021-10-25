class ChangeDatatypePaymentMethodToOrders < ActiveRecord::Migration[5.2]

  def change
    change_column :orders, :payment_method, :integer, default: false
  end

end
