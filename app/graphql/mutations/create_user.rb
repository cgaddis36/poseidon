class Mutations::CreateUser < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :user_name, String, required: true
  argument :zip, String, required: false

  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(email:, password:, first_name:, last_name:, user_name:, zip:)
    user = User.new(email: email,
                    password: password,
                    first_name: first_name,
                    last_name: last_name,
                    user_name: user_name,
                    zip: zip)
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
