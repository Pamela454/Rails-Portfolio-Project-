class MessagesController < ApplicationController

  def new  #creates a new message
    @message = Message.new(message_params)
  end

  def show
    @message = Message.find(params[:id]) #will throw an exception if not found by the attribute supplied
  end

  def index
    @messages = Messages.all
  end

private

  def user_params
    params.require(:title, :body, :user_id)
  end


end
