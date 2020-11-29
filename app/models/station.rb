class Station < ApplicationRecord
  validates :url, :state, :station_id, :lat, :lon, :location, :pred_type, presence: true
end
