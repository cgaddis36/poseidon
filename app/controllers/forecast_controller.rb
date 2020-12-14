class ForecastController < ApplicationController
  def show
    @forecast = ForecastService.new.get_forecast(session[:lat], session[:lon])
  end
end
