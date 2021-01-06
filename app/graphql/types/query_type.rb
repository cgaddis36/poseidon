module Types
  class QueryType < Types::BaseObject
    field :all_stations, resolver: Queries::AllStations


  end
end
