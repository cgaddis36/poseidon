class ForecastService
  def get_forecast(zip)
    response = conn.get("/forecasts/#{zip}", {filter: '1hr', client_id: ENV["AERIS_ACCESS_ID"], client_secret: ENV["AERIS_SECRET_KEY"]})

    parsed = JSON.parse(response.body)

    hourly_forecasts = forecast_creation(parsed)

    JSON.parse(hourly_forecasts.to_json)
  end

  private
  def conn
    Faraday.new(url: 'https://api.aerisapi.com')
  end

  def forecast_creation(parsed)
    parsed["response"][0]["periods"].map {|hourly| Forecast.new(hourly)}
  end
end
