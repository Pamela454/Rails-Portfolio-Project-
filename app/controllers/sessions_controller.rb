# frozen_string_literal: true

# class containing sessions CRUD methods
class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def new #creates a new session, login
    @user = User.new
    render 'application/welcome'
  end

  def create #creates a new session, authenticates user
    #auth = request.env["omniauth.auth"]
    @auth = auth
    if @auth.nil? 
      binding.pry 
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

  def facebook
    if !@auth.nil? 
      binding.pry 
      if User.find_by(email: auth['info']['email'])
        @user = User.find_by(email: auth['info']['email'])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    else
        flash[:notice] = 'Incorrect name and/or password'
        redirect_to root_path
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
