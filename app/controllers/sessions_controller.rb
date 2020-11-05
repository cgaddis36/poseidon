class SessionsController < ApplicationController
  def update
    if !ZipCodes.identify(params[:zipcode]).nil?
      successful_zip(params["zipcode"])
    else
      session_error
    end
  end
  
  private
  def successful_zip(zip)
    session[:zip] = zip
    redirect_to '/forecast'
  end

  def session_error
    flash[:error] = 'Zipcode does not exist, enter a correct zipcode to continue.'
    redirect_to '/'
  end
end
