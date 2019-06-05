module ApiService
  module ConvenienceMethods
    def parse(json_string)
      JSON.parse(json_string, symbolize_names: true)
    end
  end

  def geocode(location)
    geocoder.lat_long(location)
  end

  # def reverse_geocode
  #
  # end
  private

  def geocoder
    @_geocode_service ||= GeocodeService.new
  end

end
