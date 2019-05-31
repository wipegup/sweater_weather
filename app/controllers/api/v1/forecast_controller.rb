class Api::V1::ForecastController < ApplicationController

  def show
    lat_long = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:location]}&key=#{ENV['GOOGLE_API']}")
    binding.pry
    return Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API']}")
  end
end
