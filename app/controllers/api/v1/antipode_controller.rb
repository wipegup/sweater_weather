class Api::V1::AntipodeController < ApplicationController
  def show
    original_location_lat_long = geocoder.lat_long(params[:loc]).split(",")
    antipode_data = antipode.lat_long(*original_location_lat_long)
    antipode_lat_long = antipode_data[:data][:attributes]

    new_place_name = geocoder.place_name(antipode_lat_long)

    raw_forecast = weather.forecast(new_place_name)
    forecast = {
      summary: raw_forecast[:currently][:summary],
      current_temperature: raw_forecast[:currently][:temperature]
    }
    data_dict = {
      id: 1,
      type: "antipode",
      attributes: {
        location_name: new_place_name,
        forecast: forecast,
      },
      search_location: params[:loc]
    }

    render json: {data:[data_dict]}
  end

  def geocoder
    @_geocode_service ||= GeocodeService.new
  end

  def antipode
    @_antipode_service ||= AntipodeService.new
  end
end
