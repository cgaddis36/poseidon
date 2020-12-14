class ForecastService
  def get_forecast(zip)
    response = conn.get("/", {})

    parsed = JSON.parse(response.body)

    hourly_forecasts = forecast_creation(parsed)

    JSON.parse(hourly_forecasts.to_json)
  end

  private
  def conn
    Faraday.new(url: '')
  end

  def forecast_creation(parsed)
    # parsed["response"][0]["periods"].map {|hourly| Forecast.new(hourly)}
  end
end
