class PatientsController < UsersController

  def new  #directs to page to create new user
    @user = User.new
    render :new
  end

  def edit  #directs to page to edit user information
    @user = User.find(session[:user_id])
    render :edit
  end

end
