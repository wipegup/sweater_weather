require 'rails_helper'
describe 'call to forecast with location' do
  scenario 'returns all forecast data' do
    url = "https://api.darksky.net/forecast/#{ENV['DARK_SKY_API']}/37.8267,-122.4233"
    body =  File.open('./api_responses/dark_sky.json')
    stub_request(:get, url).to_return(body: body)

    f = Faraday.get(url)
    
  end
end
