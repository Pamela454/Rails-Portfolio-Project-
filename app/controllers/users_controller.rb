# frozen_string_literal: true

# class containing users CRUD methods
class UsersController < ApplicationController
#need helper method?  #need skinny controllers
  
  def signin; end

  def show
    binding.pry
    @user = User.find(session[:user_id])
    if @user.type == "Patient"
      @messages = Message.where(patient_id: session[:user_id]) || "None"
    elsif @user.type = "Physician"
      @responses = Response.where(physician_id: session[:user_id]) || "None"
      @messages = Message.all
    end
  end

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
      render 'patients/new'
    end
  end

  def update
    @user = User.find(session[:user_id])
    if @user.type == "Patient"
      params[:patient] = params[:user]
     if @user.update(patient_params)
      flash[:notice] = "Profile successfully edited"
      redirect_to user_path(@user)
     else
      flash[:error] 
      render 'patients/edit'
     end
    elsif @user.type == "Physician"
      params[:physician] = params[:user]
      if @user.update(physician_params)
        flash[:notice] = "Profile successfully edited"
        redirect_to user_path(@user)
       else
        flash[:error] 
        render 'physicians/edit'
       end
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:email, :npi, :specialty, :type, :name, :uid, :password)
  end

  def patient_params #is this needed? 
    params.require(:patient).permit(:email, :name, :uid, :password)
  end

  def physician_params #is this needed? 
    params.require(:physician).permit(:email, :npi, :specialty, :type, :name, :uid, :password)
  end
end
