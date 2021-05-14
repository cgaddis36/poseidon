class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :name
      t.string :lat
      t.string :lon
      t.string :station_id
      t.string :state

      t.timestamps
    end
  end
end
