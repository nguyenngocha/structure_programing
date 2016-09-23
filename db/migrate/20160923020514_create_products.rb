class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.references :type, foreign_key: true
      t.references :color, foreign_key: true
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
