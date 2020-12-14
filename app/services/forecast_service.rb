class ForecastService
  def get_forecast(latitude, longitude)
    response = conn.get("/data/2.5/onecall", {lat: latitude, lon: longitude, exclude: 'minutely', units: 'imperial', appid: ENV['OPEN_WEATHER_API_KEY']})

    parsed = JSON.parse(response.body)

    hourly_forecasts = forecast_creation(parsed["hourly"])

    JSON.parse(hourly_forecasts.to_json)
  end

  private
  def conn
    Faraday.new(url: 'https://api.openweathermap.org')
  end

  def forecast_creation(forecast)
    forecast.map {|hourly| Forecast.new(hourly)}
  end
end
