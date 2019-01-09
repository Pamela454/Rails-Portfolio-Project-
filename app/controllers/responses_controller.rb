class ResponsesController < ApplicationController

  def new
    @response = Response.new
    @message = Message.find_by(id: params[:message_id])
  end

  def create
    @response = Response.create(response_params)
    @message = Message.find_by(id: params[:message_id])
    if @response.save
			render 'show'
		else
			render 'new'
		end
  end

  private

    def response_params # a message must have a bod, title, and user_id
      params.require(:response).permit(:response, :physician_id, :physician_id, physician_attributes:[:category])
    end


  end
