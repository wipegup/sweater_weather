class Api::V1::BackgroundsController < ApplicationController
  include ApiService
  def show
    response = flickr.landscape(params[:location])
    photo = parse(response.body)[:photos][:photo][0]

    photo_url = build_photo_url(photo)

    render json: {url: photo_url}
  end

  private

  def build_photo_url(photo_dict)
    farm_id = photo_dict[:farm]
    server_id = photo_dict[:server]
    id = photo_dict[:id]
    secret = photo_dict[:secret]
    "https://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}.jpg"

  end
  def flickr
    @_flickr_service ||= FlickrService.new
  end
end
