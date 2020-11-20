class ForecastController < ApplicationController
  def show
    @forecast = ForecastService.new.get_forecast(session[:zip])[0..10]
  end
end
