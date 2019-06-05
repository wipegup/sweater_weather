class WeatherSerializer

  def self.serialize(forecast)
    s = {
      latitude: forecast[:latitude],
      longitude: forecast[:longitude],
      currently: Current.new(forecast[:currently]),
      daily: Daily.new(forecast[:daily]),
      hourly: Hourly.new(forecast[:hourly])
    }.to_json
  end

end
