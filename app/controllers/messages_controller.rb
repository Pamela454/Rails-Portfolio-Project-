class MessagesController < ApplicationController
#before action to restric access?? would apply to other controllers
  def new  #creates a new message
    @message = Message.new(patient_id: current_user.id)
    @user = User.find(session[:user_id])

  end

  def show #may not need this
    @message = Message.find(params[:patient_id]) #will throw an exception if not found by the attribute supplied
  end

  def index #is this still needed?
    @messages = Messages.find(current_user.id).messages ||= nil
    @patient = current_user
  end

  def create
    @message = Message.new(message_params)
      if @message.save!
        redirect_to :controller => 'categories', :action => 'new'
      else
        render :new
      end
  end

  def edit
    @message = Message.find(params[:patient_id])
  end

  def update
    @message = Message.find(params[:message][:id])
    @message.update(message_params)
    render :show
  end

  def destroy
    binding.pry
    @message = Message.find_by(params[:user_id])
    @message.delete

    render :index
  end

private

  def current_user
      User.find(session[:user_id])
  end

  def message_params # a message must have a bod, title, and user_id
    params.require(:message).permit(:title, :question, :patient_id, category_ids:[], categories_attributes: [:category])
  end


end
