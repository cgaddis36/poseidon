module Types
  class QueryType < Types::BaseObject
    field :all_stations, resolver: Queries::AllStations
    field :closest_station, resolver: Queries::ClosestStation
  end
end
