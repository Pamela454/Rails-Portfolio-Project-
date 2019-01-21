class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def new #creates a new session, login
    @user = User.new
    #@users = User.all
  end

  def create #creates a new session, authenticates user
    @auth = auth
    if @auth != nil #any edge cases created with two different user types?, will only be able to login through facebook
      @user = User.find_by(uid: auth['uid'])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif @auth != nil
      @user = User.create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name'] #facebook exposes users name and password in API
      u.email = auth['info']['email']    #password?
      u.password = SecureRandom.urlsafe_base64.to_s    #password?
      session[:user_id] = @user.id

      render 'users/signup'
    end #needs to raise an error for the user if unable to validate user

    else
      @user = User.find_by(email: params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:notice] = "Incorrect name and/or password"
        redirect_to root_path
      end
   end
 end

  def destroy #logs out user by deleting session
    session.delete :user_id
    flash[:notice] = "Successfully logged out"
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
