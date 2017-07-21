class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_user_cookie

  def set_user_cookie
    cookies[:rangama_uuid] = SecureRandom.uuid unless cookies[:rangama_uuid]
  end

end
