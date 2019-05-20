require 'rails_helper'

describe 'Users API' do
  it 'can create an account' do

    post '/api/v1/users'

    expect(response).to be_successful
  end
end
