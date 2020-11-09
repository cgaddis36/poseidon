class ForecastController < ApplicationController
  def show
    @forecast = ForecastService.new.get_forecast(session[:zip])
  end
end
