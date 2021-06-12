module Mutations
  module Users
    class LoginUser < ::Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      field :user, Types::UserType, null: false
      field :errors, [String], null: false

      def resolve(email:, password:)
        user = User.find_by(email: email
                        )
        if user.authenticate(password)
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
