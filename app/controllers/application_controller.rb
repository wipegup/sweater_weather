class ApplicationController < ActionController::API

  private

  def user
    User.find_by(api_key: request.headers['api_key'])
  end
end
