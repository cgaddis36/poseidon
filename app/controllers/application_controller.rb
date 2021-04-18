class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :null_session
  # skip_before_action :verify_authenticity_token


  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
