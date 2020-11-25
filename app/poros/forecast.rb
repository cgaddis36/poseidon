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
                        'sunny',
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
                        'mostly cloudy with scattered showers',
                        'partly cloudy with patchy fog',
                        'mostly cloudy with chance of light snow showers']
    image = []
    possible_weather.each do |forecast|
      if weather.downcase == forecast
        image = forecast.gsub(' ', '_') + ".jpg"
      elsif weather.downcase.include?('snow')
        image = 'general_snow.jpg'
      elsif weather.downcase.include?('rain')
        image = 'general_rain.jpg'
      elsif weather.downcase.include?('showers')
        image = 'general_rain.jpg'
      elsif weather.downcase.include?('fog')
        image = 'general_fog.jpg'
      elsif weather.downcase.include?('thunder')
        image = 'general_thunder.jpg'
      elsif weather.downcase.include?('sun')
        image = 'general_sun.jpg'
      elsif weather.downcase.include?('cloud')
        image = 'general_cloud.jpg'
      elsif weather.downcase.include?('clear')
        image = 'general_clear.jpg'
      end
    end
    image
  end
end
