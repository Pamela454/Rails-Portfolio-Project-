class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  helper_method :logged_in?, :current_user, :user_type
  layout "application"
  
  def authenticate
  	redirect_to root_path unless user_signed_in?
  end

  def welcome

  end

  def login_required
    redirect_to root_path unless logged_in?
  end

  def user_type
    User.find(session[:user_id]).type
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
