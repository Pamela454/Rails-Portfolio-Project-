class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  #prevents cross-site request forgery. Raises an exception if an attack occurs.

  def authenticate
  	redirect_to :login unless user_signed_in?
  end

  def welcome

  end


end
