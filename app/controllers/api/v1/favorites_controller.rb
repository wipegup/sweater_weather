class Api::V1::FavoritesController < ApplicationController

  def create
    binding.pry
    if user
      Favorite.create(user: user, location: request.headers['HTTP_LOCATION'])
      render json: {status: 'success', location: request.headers['HTTP_LOCATION']}
    else
      render status: 401
    end
  end

  def destroy
    if user
      favorite = user.favorites.find_by(location: request.headers['HTTP_LOCATION'])
      favorite.destroy

      render json: {status: 'success', location: request.headers['HTTP_LOCATION']}
    else
      render status: 401
    end
  end

  def index
    if user
      data = user.favorites.map do |fav|
        {
          'location': fav.location,
          'current_weather': WeatherFacade.forecast(fav.location)
        }
      end
        render json: data
    else
      render status: 401
    end
  end

end
