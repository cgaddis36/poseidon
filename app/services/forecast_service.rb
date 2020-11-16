class ForecastService
  def get_forecast(zip)
    response = conn.get("/forecasts/#{zip}", {filter: '1hr', client_id: ENV["AERIS_ACCESS_ID"], client_secret: ENV["AERIS_SECRET_KEY"]})

    parsed = JSON.parse(response.body)

    hourly_forecasts = parsed["response"][0]["periods"].map {|hourly| Forecast.new(hourly)}

    JSON.parse(hourly_forecasts.to_json)
  end

  # def get_tides(zip)
  #   response = conn.get("/tides/#{zip}", {client_id: ENV["AERIS_ACCESS_ID"], client_secret: ENV["AERIS_SECRET_KEY"]})
  #   parsed = JSON.parse(response.body)
  #
  # end

  private
  def conn
    Faraday.new(url: 'https://api.aerisapi.com')
  end
end
