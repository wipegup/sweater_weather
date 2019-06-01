class WeatherService
  include ApiService
  def initialize

  end

  def forecast(location)
    lat_long = geocode(location)
    parse(conn.get(lat_long).body)

  end

  private

  def conn
  Faraday.new("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API']}/") do |f|
    f.adapter Faraday.default_adapter
    end
  end

  def geocode(location)
    @_geocode_service ||= GeocodeService.new
    @_geocode_service.lat_long(location)
  end
end
