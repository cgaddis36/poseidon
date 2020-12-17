class UserController < ApplicationController
  def login
    require "pry"; binding.pry
  end
  def new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:current_user] = user.id
      session[:zip] = user.zip
      flash[:success] = "Welcome, #{user.user_name}!"
      redirect_to '/forecast'
    else
      flash[:notice] = user.errors.full_messages.to_sentence
      redirect_to '/register'
    end
  end

  private
  def user_params
   params.permit(:first_name, :email, :zip, :last_name, :user_name, :password, :password_confirmation)
 end
end
