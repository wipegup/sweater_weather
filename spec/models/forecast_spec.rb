require 'rails_helper'

describe 'Call to Forecast Model with Darksky data' do
  scenario 'returns needed forecast data' do
    dark_sky_json =  JSON.load(File.open('./api_responses/dark_sky.json'))

    forecast = Forecast.new(dark_sky_json)

    #Today:
      # Temp: Current, Day High, Day Low, Feels Like
        # ['currently']['temparature'] / 'apparentTemperature'
        # 'uvIndex'
      # Humidity, Visibility, UV Index
        # ['currently'] [visibility'] / 'visibility'

      # Time, Date, Location # Unix time stamps
      # Current Weather:
        # Today/Tonight descriptions
        # Current (partly cloudy e.g) ['currently']['summary']

    # Forecast
      # Hours:
      # ['hourly']
        # Temp, Type (pt.cloudy)
      # Days
        # Temp, Precip chance, High, Low

    expect()
    binding.pry
  end
end
