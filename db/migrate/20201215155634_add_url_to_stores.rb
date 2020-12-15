class AddUrlToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :url, :string
  end
end
