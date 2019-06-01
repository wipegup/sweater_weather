require 'rails_helper'

describe 'request using city' do
  it 'returns forecast for that city' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    latitude = 39.7392358
    longitude = -104.990251
    expect(response['latitude']).to eq(latitude)
    expect(response['longitude']).to eq(longitude)
    keys =  %w(currently minutely hourly daily)

    keys.each do |key|
      expect(response.keys).to include(key)
    end


  end
end
