# frozen_string_literal: true

# class containing users CRUD methods
class UsersController < ApplicationController
  # need helper method?  #need skinny controllers
  # displays option to log in
  def signin
    binding.pry
  end

  # directs to users show page. Can view messages sent and respond
  def show
    @user = User.find(session[:user_id])
    @messages = Message.where(patient_id: session[:user_id]) || 'None'
    @responses = Response.where(physician_id: session[:user_id]) || 'None'
    render layout: false
  end

  # creates a new user
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Profile successfully created'
      redirect_to user_path(@user)
    elsif params[:user][:type] == 'Physician'
      flash[:error]
      render 'physicians/new'
    elsif params[:user][:type] == 'Patient'
      flash[:error]
      render 'physicians/new'
    end
  end

  # edit user info
  def update
    @user = User.find(session[:user_id])
    if user_type == 'Patient'
      @user.update(patient_params)
    else
      @user.update(user_params)
    end
    flash[:notice] = 'Profile successfully edited'
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  # def user_type switch statement
  #  case params[:type]
  #  when 'Physician'
  #    'physician'
  #  when 'Patient'
  #    'patient'
  #  end
  # end

  def user_params
    params.require(:user).permit(:email, :npi, :specialty, :type, :name, :uid, :password)
  end

  def patient_params
    params.require(:patient).permit(:email, :name, :uid, :password)
  end

  def physician_params
    params.require(:physician).permit(:email, :npi, :specialty, :type, :name, :uid, :password)
  end
end
