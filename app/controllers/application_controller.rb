class ApplicationController < ActionController::API

  def weather
    @_weather = WeatherService.new
  end
  
end
