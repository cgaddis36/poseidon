module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: true
    field :password_digest, String, null: true
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :user_name, String, null: true
    field :zip, String, null: true
    field :reviews, [Types::ReviewType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
