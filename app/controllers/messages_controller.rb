class MessagesController < ApplicationController
#before action to restric access?? would apply to other controllers
  def new  #creates a new message
    @message = Message.new(message_params)
  end

  def show #shows all messages from a given user
    @message = Message.find(params[:user_id]) #will throw an exception if not found by the attribute supplied
  end

  def index #displays all messages
    @messages = Messages.all
  end

  def edit
  end

  def update
    @message.update(message_params)
    redirect_to @message
  end

  def destroy
    @message.destroy
    redirect_to @message 
  end

private

  def user_params # a message must have a bod, title, and user_id
    params.require(:title, :body, :user_id)
  end


end
