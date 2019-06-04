class WeatherFacade < BaseFacade

  def self.forecast(location)
    weather.forecast(location)
  end
  private

  def self.weather
    @_weather = WeatherService.new

  end
end
