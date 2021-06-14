module Types
  class QueryType < Types::BaseObject
    field :all_stations, resolver: Queries::AllStations
    field :closest_station, resolver: Queries::ClosestStation
    field :get_businesses_by_location, resolver: Queries::GetBusinessesByLocation
  end
end
