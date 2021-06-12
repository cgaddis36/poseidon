module Types
  class MutationType < Types::BaseObject

    field :create_user, mutation: Mutations::Users::CreateUser
    field :update_user, mutation: Mutations::Users::UpdateUser
    field :login_user, mutation: Mutations::Users::LoginUser
  end
end
