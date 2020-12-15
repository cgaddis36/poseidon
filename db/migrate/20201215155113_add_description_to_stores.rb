class AddDescriptionToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :description, :string
  end
end
