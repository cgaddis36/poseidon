class AddZipcodesToStation < ActiveRecord::Migration[5.2]
  def change
    add_column :stations, :zipcodes, :string, array: true, default: []
  end
end
