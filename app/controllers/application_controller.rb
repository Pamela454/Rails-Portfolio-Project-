# frozen_string_literal: true

# class containing helper methods related to login and authentication of user
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :user_type

  def authenticate
    redirect_to root_path unless user_signed_in?
  end

  def welcome; end

  def login_required
    redirect_to root_path unless logged_in?
  end

  def user_type
    User.find(session[:user_id]).type
  end

  def patient_user
    User.find(session[:user_id]).type == 'patient'
  end

  def physician_user
    User.find(session[:user_id]).type == 'physician'
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
