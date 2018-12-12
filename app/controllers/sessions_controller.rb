class SessionsController < ApplicationController

  def new #creates a new session, login
    @user = User.new
    @users = User.all
  end

  def create #creates a new session, authenticates user
    if auth
      binding.pry
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']    #password?
    end
  	session[:user_id] = @user.id

  	redirect_to @user

    else
      @user = User.find_by(email: params[:session][:email])
      if @user && @student.authenticate(params[:session][:password])
        session[:user_id] = @user.id   #need flash message?
    else
        render :new
      end
    end
  end

  def destroy #logs out user by deleting session
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
