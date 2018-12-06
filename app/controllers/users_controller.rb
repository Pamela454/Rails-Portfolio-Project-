class UsersController < ApplicationController  #

  def home  #displays option to log in

  end

  def show  #directs to users show page. Can view messages sent and responded to
  end

  def new  #directs to page to create new user
    @user = User.new
  end

  def create  #creates a new user
  end

  def edit   #directs to page to edit user information
  end

  def update  #edit user info 
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
    params.require(:first_name, :last_name, :password_digest, :user_type, :email).permit(:npi, :specialty)
  end
end
