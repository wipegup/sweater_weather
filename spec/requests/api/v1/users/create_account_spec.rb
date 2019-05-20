require 'rails_helper'

describe 'Users API' do
  it 'can create an account' do
    user = attributes_for(:user)
    post '/api/v1/users', headers: {"ACCEPT" => "application/json",
                                   'email'=> user[:email],
                                   'password'=> user[:password_digest],
                                   'password_confirmation'=> user[:password_digest]}

    expect(response).to be_successful
    created_user = User.last

    expect(created_user.email).to eq(user[:email])
    expect(created_user.api_key).not_to eq(nil)
  end
end
