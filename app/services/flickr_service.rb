class FlickrService
  include ApiService
  include ApiService::ConvenienceMethods
  
  def landscape(location)
    lat_long = geocode(location).split(",")
    lat_long = {lat: lat_long[0].to_s, lon: lat_long[1].to_s}

    response = conn.get('', {accuracy: "10", **lat_long} )
    photo = parse(response.body)[:photos][:photo][0]

    photo_url = build_photo_url(photo)
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

  def build_photo_url(photo_dict)
    farm_id = photo_dict[:farm]
    server_id = photo_dict[:server]
    id = photo_dict[:id]
    secret = photo_dict[:secret]
    "https://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}.jpg"
  end

end
