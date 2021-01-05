module Types
  class StoreType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :address, String, null: true
    field :city, String, null: true
    field :state, String, null: true
    field :zip, String, null: true
    field :phone_number, String, null: true
    field :fly, Boolean, null: true
    field :bait, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :description, String, null: true
    field :url, String, null: true
    field :public, Boolean, null: true
    field :guide, Boolean, null: true
  end
end
