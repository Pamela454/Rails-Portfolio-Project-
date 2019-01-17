class ResponsesController < ApplicationController

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

  #def edit
  #    @user = User.find(session[:user_id])
  #    @message = Message.find_by(id: params[:response][:message_id])
  #    if @user.type == "Physician"
  #      flash[:notice] = "Response successfully edited"
  #      render 'messages/edit_response'
  #    end
  #end

  private

  def response_params # a message must have a bod, title, and user_id
      params.require(:response).permit(:response, :message_id, :physician_id, physician_attributes:[:category])
  end


end
