module Mutations
  module Users
    class UpdateUser < ::Mutations::BaseMutation
      argument :id, ID, required: true
      argument :email, String, required: false
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :user_name, String, required: false
      argument :zip, String, required: false

      field :user, Types::UserType, null: false
      field :errors, [String], null: false

      def resolve(id:, **attributes)
        user = User.find(id)
        user.update!(attributes)
        if user.save
          {
            user: user,
            errors: []
          }
        else
          {
            user: nil,
            errors: user.errors.full_messages
          }
        end
      end
    end
  end
end
