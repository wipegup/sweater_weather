require 'rails_helper'

describe Api::V1::FavoritesController do
  it 'can add favorite location' do
    user = create(:user)
    post '/api/v1/favorites',
      headers: {"ACCEPT" => "application/json",
        "location": "Denver, CO",
        "api_key": "123"
      }

    expect(response).to have_http_status(401)

    post '/api/v1/favorites',
      headers: {"ACCEPT" => "application/json",
        "location": "Denver, CO",
        "api_key": user.api_key
      }

    expect(response).to be_successful
    expect(user.favorites.last.location).to eq("Denver, CO")
    # binding.pry
  end

  it 'can get favorite locations' do

    get '/api/v1/favorites'

    expect(response).to be_successful
  end

  it 'can delete favorite location' do

    delete '/api/v1/favorites'

    expect(response).to be_successful
  end
end
