require 'rails_helper'

describe 'Call to Forecast Model with Darksky data' do
  scenario 'returns needed forecast data' do
    dark_sky_json =  JSON.load(File.open('./api_responses/dark_sky.json'))

    # forecast = Forecast.new(dark_sky_json)

    #Today:
      # Temp: Current, Day High, Day Low, Feels Like
        # ['currently']['temparature'] / 'apparentTemperature'
        # 'uvIndex'
      # Humidity, Visibility, UV Index
        # ['currently'] [visibility'] / 'visibility'

      # Time, Date, Location # Unix time stamps
      # Current Weather:
        # Today/Tonight descriptions
        # Current (partly cloudy e.g) ['currently']['icon]

    # Forecast
      # Hours:
      # ['hourly']['data'](list)
      # ['time'](unix)
        # Temp, Type (pt.cloudy) ['icon']['temperature']
      # Days
        # 'daily'
        # 'data'
        # Precip chance, High, Low
        # 'time'-> date, 'temperatureHigh', 'temperatureLow', 'precipProbability'
        #

        # Time conversion using Time.at(<unix_ts>)
    # binding.pry
  end
end
