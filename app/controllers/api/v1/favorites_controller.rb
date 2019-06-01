class Api::V1::FavoritesController < ApplicationController

  def create
    user = User.find_by(api_key: request.headers['api_key'])

    if user
      Favorite.create(user: user, location: request.headers['location'])
    else
      render status: 401
    end
  end

  def destroy

  end

  def index

  end
end
