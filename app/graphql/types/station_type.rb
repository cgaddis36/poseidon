module Types
  class StationType < Types::BaseObject
    field :id, ID, null: false
    field :location, String, null: true
    field :lat, String, null: true
    field :lon, String, null: true
    field :station_id, String, null: true
    field :url, String, null: true
    field :pred_type, String, null: true
    field :state, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
