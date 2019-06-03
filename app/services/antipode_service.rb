class AntipodeService
  include ApiService

  def lat_long(lat, long)
    parse(conn.get('antipodes', {lat: lat, long: long}).body)
  end
  private

  def conn
    Faraday.new("http://amypode.herokuapp.com/api/v1/") do |f|
      f.adapter Faraday.default_adapter
      f.headers['api_key'] = ENV['ANTIPODE_API']
    end
  end

end
