class ResponsesController < ApplicationController
  before_action :login_required

  def new
    if user_type == "Physician"
      @response = Response.new(physician_id: params[:user_id])
      @message = Message.find_by(id: params[:message])
    else
      flash[:notice] = "You do not have access to this feature."
      redirect_to :controller => 'users', :action => 'show', :id => current_user.id
    end
  end

  def create
    @message = Message.find_by(id: params[:response][:message_id])
    @response = Response.create(response_params)
    if @response.save
      flash[:notice] = "Response successfully created"
      redirect_to :controller => 'users', :action => 'show', :id => 'current_user'
		else
			render 'new'
		end
  end

  def edit
    if user_type == "Physician"
      if params[:user_id]
        physician = Physician.find_by(id: params[:user_id])
        if physician = nil
          redirect_to :controller => 'users', :action => 'show', :id => current_user.id
        elsif
          @response = Response.find_by(id: params[:id])
          @user = User.find(session[:user_id])
        end
    else
      flash[:notice] = "You do not have access to this feature."
      redirect_to :controller => 'users', :action => 'show', :id => current_user.id
     end
    end
  end

  def update  #edit user info
    if user_type == "Physician"
     @response = Response.find(params[:id])
     @response.update(response_params)
     flash[:notice] = "Response successfully edited"
     redirect_to :controller => 'users', :action => 'show', :id => current_user.id
   else
     render :edit
   end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.delete
    flash[:notice] = "Response successfully deleted"
    redirect_to :controller => 'users', :action => 'show'
  end

  private

  def response_params # a message must have a body, title, and user_id
      params.require(:response).permit(:response, :message_id, :physician_id, physician_attributes:[:category])
  end


end
