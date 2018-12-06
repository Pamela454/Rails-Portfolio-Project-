class UsersController < ApplicationController

  def home
  
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
