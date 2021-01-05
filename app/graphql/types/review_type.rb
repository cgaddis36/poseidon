module Types
  class ReviewType < Types::BaseObject
    field :id, ID, null: false
    field :comment, String, null: true
    field :user_id, Integer, null: true
    field :store_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :rating, String, null: true
  end
end
