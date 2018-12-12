class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  #prevents cross-site request forgery. Raises an exception if an attack occurs.

  def authenticate
  	redirect_to :login unless user_signed_in?
  end

  def welcome
    
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
  	# converts current_user to a boolean by negating the negation
  	!!current_user
  end


end
