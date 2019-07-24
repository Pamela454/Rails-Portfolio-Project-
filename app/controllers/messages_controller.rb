class MessagesController < ApplicationController
  before_action :login_required
#before action to restric access?? would apply to other controllers
  def new  #creates a new message    @message = Message.new(patient_id: current_user.id)
   if user_type == "Patient" #changed for nested route
     if params[:user_id] && Patient.exists?(params[:user_id])
     @message = Message.new(patient_id: params[:user_id])
   else
     flash[:notice] = "You do not have access to this feature."
     redirect_to :controller => 'users', :action => 'show', :id => current_user.id
    end
   end
  end

  def show #may not need this
    @message = Message.find_by(params[:id]) #will throw an exception if not found by the attribute supplied
    respond_to do |m|
      m.html {render :show}  
      m.json {render json: @message} #show page for JSON data 
    end
  end

  def index
    if params[:user_id]
      @messages = Message.where(patient_id: params[:user_id])
      respond_to do |m|
        m.html {render html :index}
        m.json {render json: @messages} #index page for JSON data 
      end
    else
      @messages = Message.all
      respond_to do |m|
        m.html {render html :index}
        m.json {render json: @messages}
      end
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Message successfully created"
      redirect_to :controller => 'users', :action => 'show', :id => current_user.id
    else
      render :new
    end
  end

  def edit
    if user_type == "Patient"
      if params[:user_id]
        patient = Patient.find_by(id: params[:patient_id])
        if patient = nil
          redirect_to :controller => 'users', :action => 'show', :id => current_user.id
        else
        @message = Message.find_by(id: params[:id])
        end
     else
      flash[:notice] = "You do not have access to this feature."
      redirect_to :controller => 'users', :action => 'show', :id => current_user.id
      end
    end
  end

  def update
    if user_type == "Patient"
      @message = Message.find(params[:id])
      @message.update(message_params)
      flash[:notice] = "Message successfully updated"
      render :show
    else
      redirect_to :controller => 'users', :action => 'show', :id => current_user.id
    end
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
