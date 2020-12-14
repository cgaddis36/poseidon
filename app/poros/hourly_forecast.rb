class HourlyForecast
  attr_reader :time,
              :temp,
              :dewpoint,
              :humidity,
              :pop,
              :precip,
              :feels_like,
              :pressure,
              :wind_direction,
              :wind_speed,
              :wind_gusts,
              :weather,
              :visibility,
              :icon

  def initialize(forecast)
    @time = Time.at(forecast["dt"]).utc
    @temp = forecast["temp"]
    @dewpoint = forecast["dew_point"]
    @humidity = forecast["humidity"]
    @feels_like = forecast["feels_like"]
    @pop = forecast["pop"]
    @pressure = forecast["pressure"]
    @wind_speed = forecast["wind_speed"]
    @wind_deg = forecast["wind_deg"]
    @weather = forecast["weather"][0]["description"]
    @visibility = forecast["visibility"]
    @icon = icon_finder(forecast["weather"][0]["main"])
  end

  def icon_finder(weather)
    possible_weather = ['Clear',
                        'Clouds',
                        'Thunderstorm',
                        'Drizzle',
                        'Rain',
                        'Snow',
                        'Mist',
                        'Smoke',
                        'Haze',
                        'Fog',
                        'Sand',
                        'Dust',
                        'Ash',
                        'Squall',
                        'Tornado'
                        ]
    image = []
    possible_weather.each do |forecast|
      if weather == forecast
        image = forecast.downcase + ".jpg"
      end
    end
    image
  end
end
