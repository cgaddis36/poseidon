class Station < ApplicationRecord
  validates :station_id, presence: true
  validates :lat, presence: true
  validates :lon, presence: true
  validates :location, presence: true
end
