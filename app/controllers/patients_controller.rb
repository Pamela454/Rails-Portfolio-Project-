class PatientsController < UsersController

  def new  #directs to page to create new user
    @user = User.new
    render :new
  end

  def edit  #directs to page to edit user information
    if user_type == "Patient"
     @user = User.find(session[:user_id])
     render :edit
   else
     redirect_to :controller => 'users', :action => 'show', :id => current_user.id
   end
  end

end
