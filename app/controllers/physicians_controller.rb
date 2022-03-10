# frozen_string_literal: true

# class containing physicians CRUD methods
class PhysiciansController < UsersController
  # directs to page to create new user
  def new
    @user = User.new
    render :new
  end

  # directs to page to edit user information
  def edit
    if user_type == 'Physician'
      @user = User.find(session[:user_id])
      render :edit
    else
      redirect_to controller: 'users', action: 'show', id: current_user.id
    end
  end
end
