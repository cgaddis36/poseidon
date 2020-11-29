class SessionsController < ApplicationController
  def update
    if zip_exists(params[:zipcode])
      redirect_to '/forecast'
    else
      session_error
    end
  end

  def patch
    if zip_exists(params[:zipcode])
      redirect_to '/tides'
    else
      session_error
    end
  end

  private
  def zip_exists(zip)
    if location = ZipCodes.identify(zip)
      zip_session(zip)
      location_session(location)
      coordinates_session(zip)
    end
  end

  def zip_session(zip)
    session[:zip] = zip
  end

  def location_session(location)
    session[:location] = location[:city] + ',' + location[:state_code]
  end

  def coordinates_session(zip)
    session[:lat] = Geocoder.search(zip)[0].data["lat"][0..6]
    session[:lon] = Geocoder.search(zip)[0].data["lon"][0..6]
  end

  def session_error
    flash[:error] = 'Zipcode does not exist, enter a correct zipcode to continue.'
    redirect_to '/'
  end
end
