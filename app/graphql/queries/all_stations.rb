module Queries
  class AllStations < Queries::BaseQuery
    type [Types::StationType], null: false

    def resolve
      Station.all
    end
  end
end
