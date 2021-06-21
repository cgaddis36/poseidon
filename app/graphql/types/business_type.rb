module Types
  class BusinessType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :address, String, null: true
    field :city, String, null: true
    field :state, String, null: true
    field :hours, String, null: true
    field :url, String, null: true
    field :zip, String, null: true
    field :description, String, null: true
    field :phone_number, String, null: true
    field :average_rating, String, null: true
    field :reviews, [Types::ReviewType], null: true
    field :business_services, [Types::BusinessServiceType], null: true
    field :services, [Types::ServiceType], null: true
    field :public, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
