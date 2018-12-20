class MessagesController < ApplicationController
#before action to restric access?? would apply to other controllers
  def new  #creates a new message
    @message = Message.new
    @user = User.find(session[:user_id])

  end

  def show #shows all messages from a given user
    @message = Message.find(params[:user_id]) #will throw an exception if not found by the attribute supplied
  end

  def index #displays all messages
    @messages = Messages.all
  end

  def create
    @message = Message.new(message_params)
    @user = User.find_by(params[:id])
    @messages = Message.find_by(params[:id])
      if @message.save
        render :show
      else
        render :new
      end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message.update(message_params)
    redirect_to @message
  end

  def destroy
    @message = Message.find_by(params[:user_id])
    @message.delete

    render :index
  end

private

  def message_params # a message must have a bod, title, and user_id
    params.require(:message).permit(:title, :body, :user_id)
  end


end
