class MapsController < ApplicationController
  def show
    map = MapService.new.get_coordinates(session[:zip])
    forecast = ForecastService.new.get_forecast(map)
    require "pry"; binding.pry
  end
end
