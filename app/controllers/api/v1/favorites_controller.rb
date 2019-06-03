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

      render json: {status: 'success'}
    else
      render status: 401
    end
  end

  def index
    if user
      data = user.favorites.map do |fav|
        {'location': fav.location,
          'current_weather': weather.forecast(fav.location)
        }
      end
        render json: data
    else
      render status: 401
    end
  end

  private
  def user
    User.find_by(api_key: request.headers['api_key'])
  end

  def weather
    @_weather_service ||= WeatherService.new
  end
end
