class ResponsesController < ApplicationController
  before_action :login_required

  def new
    @response = Response.new
    @message = Message.find_by(id: params[:message])
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
      @user = User.find(session[:user_id])
      @response = Response.find_by(id: params[:id])
  end

  def update  #edit user info
    @response = Response.find(params[:id])
    @response.update(response_params)
    flash[:notice] = "Response successfully edited"
    redirect_to :controller => 'users', :action => 'show', :id => 'current_user'
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
