class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :building
      t.integer :prefecture_id, null: false
      t.references :oreder, null: false, foreign_key: true
      t.timestamps
    end
  end
end
