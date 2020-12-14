class Forecast
  attr_reader :time,
              :temp,
              :dewpoint,
              :humidity,
              :feels_like,
              :pop,
              :pressure,
              :wind_speed,
              :wind_deg,
              :weather,
              :visibility,
              :icon,
              :date

  def initialize(forecast)
    @time = Time.at(forecast["dt"]).to_s[11..19]
    @date = Time.at(forecast["dt"]).to_s[0..10]
    @temp = forecast["temp"].to_i
    @dewpoint = forecast["dew_point"].to_i
    @humidity = forecast["humidity"]
    @feels_like = forecast["feels_like"].to_i
    @pop = (forecast["pop"] * 100).round(0)
    @pressure = forecast["pressure"]
    @wind_speed = (forecast["wind_speed"].to_i * 0.868976).round(1)
    @wind_deg = forecast["wind_deg"]
    @weather = forecast["weather"][0]["description"].titleize
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
