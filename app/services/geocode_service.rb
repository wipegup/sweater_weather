class GeocodeService
  include ApiService
  def lat_long(location)
     response = conn.get('json', 'address': location)
     json = parse(response.body)
     hash = json[:results][0][:geometry][:location]
     [hash[:lat].to_s, hash[:lng].to_s].join(",")
   end

   def place_name(lat_long_dict)
     lat_long_string = [lat_long_dict[:lat].to_s, lat_long_dict[:long].to_s].join(",")
     response = conn.get('json', latlng: lat_long_string)
     json= parse(response.body)
     json[:results][0][:formatted_address]
   end

 private

 def conn
   Faraday.new("https://maps.googleapis.com/maps/api/geocode/") do |f|
     f.adapter Faraday.default_adapter
     f.params['key'] = ENV['GOOGLE_API']
   end
 end
end
