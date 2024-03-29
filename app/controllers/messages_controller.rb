# frozen_string_literal: true

# class containing messages CRUD methods
class MessagesController < ApplicationController
  before_action :login_required
  
#before action to restric access?? would apply to other controllers
  def new  #creates a new message    @message = Message.new(patient_id: current_user.id)
    if user_type == "Patient" #changed for nested route
     if params[:user_id] && Patient.exists?(params[:user_id])
     @message = Message.new(patient_id: params[:user_id])
     @categories = Category.all
   else
     flash[:notice] = "You do not have access to this feature."
     redirect_to :controller => 'users', :action => 'show', :id => current_user.id
    end
   end
  end

  def show
    @message = Message.find(params[:id])
  end

  def index
    @message = Message.new 
    @messages = if params[:user_id]
                  Message.where(patient_id: params[:user_id])
                else
                  Message.all
                end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = 'Message successfully created'
      redirect_to controller: 'users', action: 'show', id: current_user.id
    else
      flash[:errors]
      render :new
    end
  end

  def edit
      if params[:user_id]
        patient = Patient.find_by(id: params[:user_id])
        if patient == nil
          redirect_to controller: 'users', action: 'show', id: current_user.id
        else
          @message = Message.find_by(id: params[:id])
        end
      else
        flash[:notice] = 'You do not have access to this feature.'
        redirect_to controller: 'users', action: 'show', id: current_user.id
      end
  end

  def update
    if @message = Message.find(params[:id])
      if @message.update(message_params)
        flash[:notice] = "Message successfully updated"
        redirect_to :controller => 'users', :action => 'show', :id => current_user.id
      else
        flash[:error]
        render 'messages/edit'
      end
    else
      redirect_to :controller => 'users', :action => 'show', :id => current_user.id
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.delete
    flash[:notice] = 'Message successfully deleted'
    redirect_to controller: 'users', action: 'show'
  end

  private

  def message_params
    params.require(:message).permit(:title, :question, :patient_id, category_ids: [])
  end
end
