class WeatherFacade < BaseFacade

  def self.forecast(location)
    forecast = weather.forecast(location)
    WeatherSerializer.serialize(forecast)
  end
  private

  def self.weather
    @_weather = WeatherService.new

  end
end
