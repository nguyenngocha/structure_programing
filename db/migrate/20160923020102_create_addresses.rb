class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :city, foreign_key: true
      t.references :town, foreign_key: true
      t.references :village, foreign_key: true
      t.string :home
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
