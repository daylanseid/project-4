class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :product_name
      t.string :company_name
      t.decimal :price
      t.text :description
      t.string :image
      t.integer :wishlist_id

      t.timestamps
    end
  end
end
