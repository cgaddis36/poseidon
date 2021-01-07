module Queries
  class ClosestStation < Queries::BaseQuery
    type Types::StationType, null: false
    argument :zip, String, required: true

    def resolve(zip:)
      data = Geocoder.search(zip, params: {countrycodes: 'us'})
      if !data.empty?
        data = data[0].data
        lat = data["lat"][0..6]
        lon = data["lon"][0..6]
        state = data["address"]["state"]
      else raise GraphQL::ExecutionError, "Zipcode does not exist, try another US Zipcode"
      end

      stations = Station.where(state: state)
      closest = nil
      closest_distance = nil
      stations.each do |station|
        distance = Geocoder::Calculations.distance_between([station[:lat].to_f,station[:lon].to_f], [lat.to_f,lon.to_f])
        if closest_distance.nil? || distance.abs < closest_distance
          closest = station
          closest_distance = distance.abs
        end
      end
      closest
    end
  end
end
