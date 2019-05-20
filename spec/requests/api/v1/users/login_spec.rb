require 'rails_helper'

describe 'Sessions API' do
  it 'logs in user' do

    post '/api/v1/sessions'

    expect(response).to be_successful
  end
end
