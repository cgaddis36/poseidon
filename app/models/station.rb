class Station < ApplicationRecord
  validates :url, :station_id, :lat, :lon, :location, :pred_type, presence: true
end
