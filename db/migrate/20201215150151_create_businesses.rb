class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :url
      t.string :zip
      t.string :description
      t.string :phone_number
      t.boolean :public, :default => false

      t.timestamps
    end
  end
end
