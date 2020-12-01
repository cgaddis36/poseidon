class SessionsController < ApplicationController
  def update
    if zip_exists(params[:zipcode])
      redirect_to '/forecast'
    else
      zip_error
    end
  end

  def patch
    if zip_exists(params[:zipcode]) && closest_station
      redirect_to '/tides'
    else
      station_error
    end
  end

  private
  def zip_exists(zip)
    if location = ZipCodes.identify(zip)
      zip_session(zip)
      location_session(location)
      coordinates = coordinates_session(zip)
    end
  end

  def zip_session(zip)
    session[:zip] = zip
  end

  def location_session(location)
    session[:state] = location[:state_name]
    session[:city] = location[:city]
  end

  def coordinates_session(zip)
    session[:lat] = Geocoder.search(zip)[0].data["lat"][0..6]
    session[:lon] = Geocoder.search(zip)[0].data["lon"][0..6]
  end

  def closest_station
    stations = Station.where(state: session[:state])
    closest = nil
    closest_distance = nil
    stations.each do |station|
      distance = Geocoder::Calculations.distance_between([station[:lat].to_f,station[:lon].to_f], [session[:lat].to_f,session[:lon].to_f])
      if closest_distance.nil? || distance.abs < closest_distance
        closest = station
        closest_distance = distance.abs
      end
    end
    session[:station] = closest
  end

  def zip_error
    flash[:error] = 'Zipcode does not exist, enter a correct zipcode to continue.'
    redirect_to '/'
  end

  def station_error
    flash[:error] = 'Zipcode is not in a state with tide prediction data from NOAA, please enter a correct zipcode to continue. Try: 32541'
    redirect_to '/'
  end
end
