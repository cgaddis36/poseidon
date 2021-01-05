module Types
  class QueryType < Types::BaseObject
    field :all_stations, [Types::StationType], null: false

    def all_stations
      Station.all
    end 
  end
end
