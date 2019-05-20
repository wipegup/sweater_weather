class Api::V1::UsersController < ApplicationController

  def create
    email = request.headers['email']
    password = request.headers['password']
    password_confirmation = request.headers['password_confirmation']

    user = User.new(email: email, password: password, password_confirmation: password_confirmation)
    user.save
  end
end
