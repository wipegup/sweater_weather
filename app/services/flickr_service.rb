class FlickrService
  include ApiService

  def landscape(location)
    lat_long = GeocodeService.new.lat_long(location).split(",")
    lat_long = {lat: lat_long[0].to_s, lon: lat_long[1].to_s}

    conn.get('', {accuracy: "10", **lat_long} )
  end

  private
  def conn
    Faraday.new('https://api.flickr.com/services/rest/') do |f|
      f.adapter Faraday.default_adapter

      f.params['method'] = 'flickr.photos.search'
      f.params['safe_search'] = '1'
      f.params['format'] = 'json'
      f.params['nojsoncallback'] = '1'
      f.params['api_key'] = '430449191412d4e1430ea71139efdd23'
    end

  end

end
