class MessagesController < ApplicationController
  before_action :login_required
#before action to restric access?? would apply to other controllers
  def new  #creates a new message    @message = Message.new(patient_id: current_user.id)
   @message = Message.new(patient_id: current_user.id)
  end

  def show #may not need this
    @message = Message.find(params[:id]) #will throw an exception if not found by the attribute supplied
  end

  #def index #is this still needed?
  #  @messages = Messages.find(current_user.id).messages ||= nil
  #  @patient = current_user
  #end

  def create
    @message = Message.new(message_params)
      if @message.save!
        flash[:notice] = "Message successfully created"
        redirect_to :controller => 'messages', :action => 'show', :id => @message.id
      else
        render :new
      end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_params)
    flash[:notice] = "Message successfully updated"
    render :show
  end

  def destroy
    @message = Message.find(params[:id])
    @message.delete
    flash[:notice] = "Message successfully deleted"
    redirect_to :controller => 'users', :action => 'show'
  end

private

  def message_params # a message must have a bod, title, and user_id
    params.require(:message).permit(:title, :question, :patient_id, category_ids:[])
  end


end
