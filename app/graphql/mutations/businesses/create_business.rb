module Mutations
  module Businesses
    class CreateBusiness < ::Mutations::BaseMutation
      argument :name, String, required: true
      argument :address, String, required: true
      argument :city, String, required: true
      argument :state, String, required: true
      argument :zip, String, required: true
      argument :phone_number, String, required: false
      argument :url, String, required: false
      argument :hours, String, required: false
      argument :description, String, required: false

      field :business, Types::BusinessType, null: false
      field :errors, [String], null: false

      def resolve(name:, address:, city:, state:, zip:, description:, phone_number:, hours:, url:)
         business = Business.new(
                      name: name,
                      address: address,
                      city: city,
                      state: state,
                      zip: zip,
                      hours: hours,
                      url: url,
                      description: description,
                      phone_number: phone_number
                        )
        if  business.save
          {
             business:  business,
            errors: []
          }
        else
          {
             business: nil,
            errors:  business.errors.full_messages
          }
        end
      end
    end
  end
end
