class GeocodeService
  include ApiService
  def lat_long(location)
     response = conn.get('json', 'address': location)
     json = parse(response.body)
     hash = json[:results][0][:geometry][:location]
     [hash[:lat].to_s, hash[:lng].to_s].join(",")
   end

 private

 def conn
   Faraday.new("https://maps.googleapis.com/maps/api/geocode/") do |f|
     f.adapter Faraday.default_adapter
     f.params['key'] = ENV['GOOGLE_API']
   end
 end
end
