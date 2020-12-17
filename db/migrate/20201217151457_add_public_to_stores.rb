class AddPublicToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :public, :boolean, :default => false
  end
end
