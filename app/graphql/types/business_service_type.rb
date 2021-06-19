module Types
  class BusinessServiceType < Types::BaseObject
    field :id, ID, null: false
    field :business_id, Integer, null: true
    field :service_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
