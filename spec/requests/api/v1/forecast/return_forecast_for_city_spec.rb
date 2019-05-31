require 'rails_helper'

describe 'request using city' do
  it 'returns forecast for that city' do
    get '/api/v1/forecast?location=denver,co'

    
  end
end
