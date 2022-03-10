# frozen_string_literal: true

# class containing messages CRUD methods
class MessagesController < ApplicationController
  before_action :login_required

  def new
    if user_type == 'Patient' # changed for nested route
      if params[:user_id] && Patient.exists?(params[:user_id])
        @message = Message.new(patient_id: params[:user_id])
      else
        flash[:notice] = 'You do not have access to this feature.'
        redirect_to controller: 'users', action: 'show', id: current_user.id
      end
    end
  end

  def show
    @message = Message.find(params[:id]) # will throw an exception if not found by the attribute supplied
  end

  def index
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
      render :new
    end
  end

  def edit
    if user_type == 'Patient'
      if params[:user_id]
        patient = Patient.find_by(id: params[:patient_id])
        if patient = nil
          redirect_to controller: 'users', action: 'show', id: current_user.id
        else
          @message = Message.find_by(id: params[:id])
        end
      else
        flash[:notice] = 'You do not have access to this feature.'
        redirect_to controller: 'users', action: 'show', id: current_user.id
      end
    end
  end

  def update
    if user_type == 'Patient'
      @message = Message.find(params[:id])
      @message.update(message_params)
      flash[:notice] = 'Message successfully updated'
      render :show
    else
      redirect_to controller: 'users', action: 'show', id: current_user.id
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
