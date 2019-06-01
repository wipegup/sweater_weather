require 'rails_helper'

describe 'request using city' do
  it 'returns forecast for denver' do
    get '/api/v1/forecast?location=denver,co'

    # ds_url = "https://api.darksky.net/forecast/#{ENV['DARK_SKY_API']}/39.7392358,-104.990251"
    # ds_body =  File.open('./api_responses/dark_sky_denver.json')
    # stub_request(:get, ds_url).to_return(body: ds_body)
    #
    # geo_url = "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['GOOGLE_API']}"
    # geo_body =  File.open('./api_responses/geocode_denver.json')
    # stub_request(:get, geo_url).to_return(body: geo_body)

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    latitude = 39.7392358
    longitude = -104.990251
    expect(forecast[:latitude]).to eq(latitude)
    expect(forecast[:longitude]).to eq(longitude)

    keys =  %i(currently minutely hourly daily)
    keys.each do |key|
      expect(forecast.keys).to include(key)
    end
  end

  it 'returns forecast for LA' do
    get '/api/v1/forecast?location=Los Angeles,CA'

    # ds_url = "https://api.darksky.net/forecast/#{ENV['DARK_SKY_API']}/37.8267,-122.4233"
    # ds_body =  File.open('./api_responses/dark_sky.json')
    # stub_request(:get, ds_url).to_return(body: ds_body)

    # geo_url = "https://maps.googleapis.com/maps/api/geocode/json?address=los angeles,ca&key=#{ENV['GOOGLE_API']}"
    # geo_body =  File.open('./api_responses/geocode_la.json')
    # stub_request(:get, geo_url).to_return(body: geo_body)

    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_names: true)

    latitude = 34.0522342
    longitude = -118.2436849
    expect(forecast[:latitude]).to eq(latitude)
    expect(forecast[:longitude]).to eq(longitude)

    keys =  %i(currently minutely hourly daily)
    keys.each do |key|
      expect(forecast.keys).to include(key)
    end
  end
end
