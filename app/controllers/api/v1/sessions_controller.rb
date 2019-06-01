class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: request.headers['email'])
    if user && user.authenticate(request.headers['password'])
      render json: {api_key: user.api_key}
    else
      render json: {message: "Unauthorized"}
    end
  end
end
