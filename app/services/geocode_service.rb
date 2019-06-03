class GeocodeService
  include ApiService
  def lat_long(location)
     response = conn.get('json', 'address': location)
     json = parse(response.body)
     hash = json[:results][0][:geometry][:location]
     [hash[:lat].to_s, hash[:lng].to_s].join(",")
   end

   def place_name(lat_long)
     lat_long_string = parse_lat_long(lat_long)
     response = conn.get('json', latlng: lat_long_string)
     json= parse(response.body)
     json[:results][0][:formatted_address]
   end

 private

 def parse_lat_long(lat_long)
    if lat_long.class == Array
      lat_long_string = lat_long.map{ |l| l.to_s}.join(",")
    elsif lat_long.class == Hash
      lat_long_string = [lat_long[:lat].to_s, lat_long[:long].to_s].join(",")
    else
      puts "Inappropriate input"
    end

    lat_long_string
  end


 def conn
   Faraday.new("https://maps.googleapis.com/maps/api/geocode/") do |f|
     f.adapter Faraday.default_adapter
     f.params['key'] = ENV['GOOGLE_API']
   end
 end
end
