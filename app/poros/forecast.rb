class Forecast
  attr_reader :date,
              :time,
              :temp,
              :dewpoint,
              :humidity,
              :pop,
              :precip,
              :avg_feels_like,
              :pressure,
              :wind_direction,
              :wind_speed,
              :wind_gusts,
              :weather,
              :visibility,
              :icon

  def initialize(forecast)
    @date = Date.parse(forecast["dateTimeISO"])
    @time = Time.parse(forecast["dateTimeISO"]).strftime("%I:%M %p")
    @temp = forecast["tempF"]
    @dewpoint = forecast["dewPointF"]
    @humidity = forecast["humidity"]
    @avg_feels_like = forecast["avgFeelslikeF"]
    @pop = forecast["pop"]
    @precip = forecast["precipIN"]
    @pressure = forecast["pressureMB"]
    @wind_direction = forecast["windDir"]
    @wind_speed = forecast["windSpeedKTS"]
    @wind_gusts = forecast["windGustKTS"]
    @weather = forecast["weather"]
    @visibility = forecast["visibilityMI"]
    @icon = icon_finder(forecast["weather"])
  end

  def icon_finder(weather)
    possible_weather = ['clear',
                        'mostly clear',
                        'raining',
                        'mostly sunny',
                        'snowy',
                        'isolated showers',
                        'partly cloudy',
                        'partly cloudy with drizzle',
                        'mostly cloudy with drizzle',
                        'partly cloudy with scattered showers',
                        'partly cloudy with isolated showers',
                        'mostly cloudy with isolated showers',
                        'partly cloudy with isolated storms',
                        'mostly cloudy with scattered showers']
    image = []
    possible_weather.each do |forecast|
      if weather.downcase == forecast
        image = forecast.gsub(' ', '_') + ".jpg"
      end
    end
    image
  end
end
