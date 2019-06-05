class WeatherFacade < BaseFacade

  def self.forecast(location)
    location = location.downcase
    if $redis.get(location)
      return $redis.get(location)
    else
      forecast = weather.forecast(location)
      WeatherSerializer.serialize(forecast)
    end
  end
  private

  def self.weather
    @_weather = WeatherService.new

  end
end
