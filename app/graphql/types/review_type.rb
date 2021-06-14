module Types
  class ReviewType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :comment, String, null: true
    field :rating, String, null: true
    field :business_service_id, Integer, null: true
    field :user_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
