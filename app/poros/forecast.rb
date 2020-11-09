class Forecast
  attr_reader :date_time,
              :temp,
              :dewpoint,
              :humidity,
              :pop,
              :precip,
              :pressure,
              :wind_direction,
              :wind_speed,
              :wind_gusts,
              :weather,
              :visibility,
              :icon

  def initialize(forecast)
    @date_time = forecast["dateTimeISO"]
    @temp = forecast["tempF"]
    @dewpoint = forecast["dewPointF"]
    @humidity = forecast["humidity"]
    @pop = forecast["pop"]
    @precip = forecast["precipIN"]
    @pressure = forecast["pressureIN"]
    @wind_direction = forecast["windDir"]
    @wind_speed = forecast["windSpeedMPH"]
    @wind_gusts = forecast["windGustMPH"]
    @weather = forecast["weather"]
    @visibility = forecast["visibilityMI"]
    @icon = forecast["icon"]
  end
end
