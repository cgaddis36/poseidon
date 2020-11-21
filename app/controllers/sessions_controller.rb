class SessionsController < ApplicationController
  def update
    if zip_exists(params[:zipcode])
      redirect_to '/forecast'
    else
      session_error
    end
  end

  private
  def zip_exists(zip)
    if location = ZipCodes.identify(zip)
      zip_session(zip)
      location_session(location)
    end
  end

  def zip_session(zip)
    session[:zip] = zip
  end

  def location_session(location)
    session[:location] = location[:city] + ',' + location[:state_code]
  end

  def session_error
    flash[:error] = 'Zipcode does not exist, enter a correct zipcode to continue.'
    redirect_to '/'
  end
end
