class Api::V1::AntipodeController < ApplicationController
  def show
    original_location_lat_long = geocoder.lat_long(params[:loc]).split(",")
    original_place = geocoder.place_name(original_location_lat_long)

    antipode_lat_long = antipode.lat_long(*original_location_lat_long)
    new_place = geocoder.place_name(antipode_lat_long)

    raw_forecast = weather.forecast(new_place)
    forecast = ForecastSerializer.from_darksky(raw_forecast)

    render json: create_json(original_place, new_place, forecast)
  end

  private

  def create_json(original, antipode, forecast)
    {
      data: [{
        id: 1,
        type: "antipode",
        attributes: {
          location_name: antipode,
          forecast: forecast,
        },
        search_location: original
      }]
    }

  end
  def geocoder
    @_geocode_service ||= GeocodeService.new
  end

  def antipode
    @_antipode_service ||= AntipodeService.new
  end
end
