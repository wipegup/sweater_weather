class Api::V1::BackgroundsController < ApplicationController

  def show
    render json: FlickrFacade.landscape(params[:location])
  end

end
