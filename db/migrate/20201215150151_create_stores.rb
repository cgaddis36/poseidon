class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_number
      t.boolean :fly, :default => false
      t.boolean :bait, :default => false

      t.timestamps
    end
  end
end
