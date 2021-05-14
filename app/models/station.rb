class Station < ApplicationRecord
  validates :state, :station_id, :lat, :lon, :name, presence: true
end
