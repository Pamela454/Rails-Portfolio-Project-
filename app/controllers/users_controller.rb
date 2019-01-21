class UsersController < ApplicationController
#need helper method?  #need skinny controllers
#search messages - use form_tag, not directly connected to a model
  def signin  #displays option to log in

  end

  def show  #directs to users show page. Can view messages sent and respond
    @user = User.find(session[:user_id])
    @messages = Message.where(patient_id: session[:user_id]) || "None"
  end

  def create  #creates a new user
    @user = User.new(user_params)
      if @user.save!
        session[:user_id] = @user.id
        flash[:notice] = "Profile successfully created"
        redirect_to user_path(@user)
    else
        render :new
      end
  end

  def update  #edit user info
    @user = User.find(session[:user_id])
    @user.update(user_params)
    flash[:notice] = "Profile successfully edited"
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_type
    case params[:type]
    when 'Physician'
      'physician'
    when 'Patient'
      'patient'
    end
  end

  def user_params
    params.require(:user).permit(:email, :npi, :specialty, :type, :name, :uid, :password)
  end
end
