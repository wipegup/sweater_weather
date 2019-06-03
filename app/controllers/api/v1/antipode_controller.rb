class Api::V1::AntipodeController < ApplicationController
  def show
    original_location_lat_long = geocoder.lat_long(params[:loc]).split(",")
    antipode_lat_long = antipode.lat_long(*original_location_lat_long)

    binding.pry
  end

  def geocoder
    @_geocode_service ||= GeocodeService.new
  end

  def antipode
    @_antipode_service ||= AntipodeService.new
  end
end
