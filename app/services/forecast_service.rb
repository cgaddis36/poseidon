class ForecastService
  def get_forecast(coordinates)
    response = conn.get('/premium/v1/marine.ashx', {key: ENV['WEATHER_API_KEY'], q: coordinates["latitude"] + ',' + coordinates["longitude"], format: 'json', tide: 'yes'})
    require "pry"; binding.pry
  end

  private
  def conn
    Faraday.new(url: 'http://api.worldweatheronline.com')
  end
end
