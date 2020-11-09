class ForecastController < ApplicationController
  def show
    forecast = ForecastService.new.get_forecast(session[:zip])

    require "pry"; binding.pry
  end
end
