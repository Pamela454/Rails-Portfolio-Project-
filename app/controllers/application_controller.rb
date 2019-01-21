class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  #prevents cross-site request forgery. Raises an exception if an attack occurs.
  helper_method :user_signed_in, :current_user

  def authenticate
  	redirect_to root_path unless user_signed_in?
  end

  def welcome

  end

  def login_required
    redirect_to root_path unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
