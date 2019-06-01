class Api::V1::ForecastController < ApplicationController

  def show
    forecast = weather.forecast(params[:location])
    
    render json: forecast
  end

  private

  def weather
    @_weather = WeatherService.new
  end
end
