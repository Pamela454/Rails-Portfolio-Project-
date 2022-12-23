# frozen_string_literal: true

# class containing sessions CRUD methods
class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def new 
  end

  def create  
    auth = request.env["omniauth.auth"]
    @auth = auth
    if !@auth.nil? 
      @user = User.find_by(uid: auth['uid'])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif !@auth.nil?
      @user = User.create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name'] 
        u.email = auth['info']['email'] 
        u.password = SecureRandom.urlsafe_base64.to_s 
        session[:user_id] = @user.id

        render 'sessions/new'
      end

    else
      @user = User.find_by(email: params[:user][:email])
      if @user&.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:notice] = 'Incorrect name and/or password'
        redirect_to root_path
      end
    end
  end

  def destroy
    session.delete :user_id
    flash[:notice] = 'Successfully logged out'
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def user_params
    params.require(:user).permit(:email, :npi, :specialty, :type, :name, :uid, :password)
  end
end
