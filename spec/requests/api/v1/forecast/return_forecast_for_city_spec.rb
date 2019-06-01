require 'rails_helper'

describe 'request using city' do
  it 'returns forecast for that city' do
    get '/api/v1/forecast?location=denver,co'

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
end
