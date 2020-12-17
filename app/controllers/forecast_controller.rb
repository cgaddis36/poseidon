class ForecastController < ApplicationController
  def show
    if session[:lat].nil? || session[:lon].nil?
      flash[:alert] = 'Please enter a zipcode to get started'
      redirect_to request.referrer
    else
      @forecast = ForecastService.new.get_forecast(session[:lat], session[:lon])
    end
  end
end
