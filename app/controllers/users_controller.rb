class UsersController < ApplicationController


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
    params.require(set_type.to_sym).permit(:first_name, :last_name, :password_digest, :user_type, :email)
  end
end
