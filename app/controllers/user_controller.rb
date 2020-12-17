class UserController < ApplicationController
  def new
  end

  def show
  end

  def update
    user = current_user.update(user_params)
    if user
      flash[:notice] = "#{current_user.user_name} successfully updated."
      redirect_to '/user'
    else
      flash[:notice] = user.errors.full_messages.to_sentence
      redirect_to request.referrer
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :zip, :email)
  end
end
