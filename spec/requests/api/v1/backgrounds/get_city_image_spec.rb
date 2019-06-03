require 'rails_helper'

describe 'Background API' do
  it 'returns image' do

    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json.keys).to include(:url)

    get json[:url]

    expect(response).to be_successful
  end
end
