require 'rails_helper'

describe 'Forecast API' do
  it 'returns all forecast data' do
    url = "https://api.darksky.net/forecast/#{ENV['DARK_SKY_API']}/37.8267,-122.4233"
    body =  File.open('./api_responses/dark_sky.json')
    stub_request(:get, url).to_return(body: body)

    get '/api/v1/forecast?location=Los Angeles,CA'

    expect(response).to be_successful
  end
end
