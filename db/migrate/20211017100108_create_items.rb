class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :item
      t.string :image
      t.text :item_explanation
      t.integer :price
      t.boolean :sale_status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
