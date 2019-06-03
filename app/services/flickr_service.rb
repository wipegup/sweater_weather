class FlickrService
  include ApiService

  def landscape(location)
    conn.get('', {tags: location+",landscape"} )
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
