class AddGuideToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :guide, :boolean, :default => false
  end
end
