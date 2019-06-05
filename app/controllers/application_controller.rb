class ApplicationController < ActionController::API

  private

  def user
    User.find_by(api_key: request.headers['HTTP_API_KEY'])
  end
end
