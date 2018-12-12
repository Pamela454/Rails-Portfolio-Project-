class UsersController < ApplicationController  #
#need helper method?

  def home  #displays option to log in

  end

  def show  #directs to users show page. Can view messages sent and respond
    @user = User.find(params[:id])

  end

  def new  #directs to page to create new user
    @user = User.new
  end

  def create  #creates a new user
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
  end

  def edit   #directs to page to edit user information
  end

  def update  #edit user info
    @user.update(params)
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
    params.require(:email).permit(:npi, :specialty, :user_type, :first_name, :last_name, :password_digest)
  end
end
