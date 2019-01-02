class UsersController < ApplicationController
#need helper method?  #need skinny controllers
#search messages - use form_tag, not directly connected to a model 
  def signin  #displays option to log in

  end

  def show  #directs to users show page. Can view messages sent and respond
    @user = User.find(session[:user_id])
    @messages = Message.where(user_id: session[:user_id]) || "None"
  end

  def new_patient  #directs to page to create new user
    @user = User.new
    render "new_patient"
  end

  def new_physician  #directs to page to create new user
    @user = User.new
    render "new_physician"
  end

  def create  #creates a new user
    @user = User.new(user_params)
      if @user.save!
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
  end

  def edit_patient  #directs to page to edit user information
    @user = User.find(session[:user_id])
    render :edit_patient
  end

  def edit_physician  #directs to page to edit user information
    @user = User.find(session[:user_id])
    render :edit_physician
  end

  def edit_response
      @user = User.find(session[:user_id])
      @message = Message.first
      if @user.user_type == "Physician"
        render 'messages/edit_response'
      end
  end

  def update  #edit user info
    @user = User.find(session[:user_id])
    @user.update(user_params)
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_type
    case params[:user_type]
    when 'Physician'
      'physician'
    when 'Patient'
      'patient'
    end
  end

  def user_params
    params.require(:user).permit(:email, :npi, :specialty, :user_type, :name, :uid, :password)
  end
end
