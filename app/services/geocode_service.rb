class GeocodeService
  include ApiService::ConvenienceMethods
  def lat_long(location, as = String)
     response = conn.get('json', 'address': location)
     json = parse(response.body)
     lat_long = json[:results][0][:geometry][:location]
     format_lat_long(lat_long, as)
   end

 private

 def format_lat_long(hash, as)
   lat = hash[:lat].to_s
   lng = hash[:lng].to_s
   if as == String
     return [lat,lng].join(",")
   # elsif as == Array
   #   return [lat,lng]
   # elsif as.class == Array
   #   return {as[0]=>lat, as[1]=>lng}
   # else
   #   puts "Incorrect format"
   end


 end
 def conn
   Faraday.new("https://maps.googleapis.com/maps/api/geocode/") do |f|
     f.adapter Faraday.default_adapter
     f.params['key'] = ENV['GOOGLE_API']
   end
 end

 def parse(json_string)
   JSON.parse(json_string, symbolize_names: true)
 end
end
