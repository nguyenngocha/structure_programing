class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.references :product_type, foreign_key: true
      t.references :product_color, foreign_key: true
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
