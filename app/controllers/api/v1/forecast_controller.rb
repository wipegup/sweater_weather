class Api::V1::ForecastController < ApplicationController

  def show
    render json: WeatherFacade.forecast(params[:location])
  end

end
