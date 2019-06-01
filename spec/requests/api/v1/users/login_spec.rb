require 'rails_helper'

describe 'Sessions API' do
  it 'logs in user' do
    user = create(:user, password: "password")

    post '/api/v1/sessions', headers: {"email": user.email,
                                       "password": "not_correct"}

    expect(response).to have_http_status(401)
    
    post '/api/v1/sessions', headers: {"email": user.email,
                                       "password": "password"}

    expect(response).to be_successful

    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(json_response[:api_key]).to eq(user.api_key)
  end
end
