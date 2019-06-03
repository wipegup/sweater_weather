class Api::V1::FavoritesController < ApplicationController

  def create
    if user
      Favorite.create(user: user, location: request.headers['location'])
    else
      render status: 401
    end
  end

  def destroy
    if user
      favorite = user.favorites.find_by(location: request.headers['location'])
      favorite.destroy
    else
      render status: 401
    end
  end

  def index

  end

  private
  def user
    User.find_by(api_key: request.headers['api_key'])
  end
end
