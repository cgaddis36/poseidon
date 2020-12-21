class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      zip_exists(user.zip)
      flash[:alert] = "Hello #{user.user_name}, here is your hourly forecast for #{user.zip}"
      redirect_to '/forecast'
    else
      flash[:alert] = "Email or password entered incorrectly, please try again."
      redirect_to request.referrer
    end
  end

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
    elsif zip_exists(session[:zip]) && closest_station
      redirect_to '/tides'
    else
      station_error
    end
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    flash[:alert] = "Successfully logged out."
    session.clear
    redirect_to '/'
  end

  def creation
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      zip_exists(user.zip)
      flash[:success] = "Welcome #{user.user_name} here is your forecast for #{user.zip}!"
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
    session[:lat] = Geocoder.search(zip, params: {countrycodes: 'us'})[0].data["lat"][0..6]
    session[:lon] = Geocoder.search(zip, params: {countrycodes: 'us'})[0].data["lon"][0..6]
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
