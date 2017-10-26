class ApplicationController < ActionController::Base
  before_action :set_raven_context
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_raven_context
    Raven.user_context(id: session[:user_id])
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
