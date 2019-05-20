require 'rails_helper'

describe 'Users API' do
  it 'can add favorite location' do

    post '/api/v1/favorites'

    expect(response).to be_successful
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
