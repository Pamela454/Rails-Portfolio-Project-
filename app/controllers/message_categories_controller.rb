class MessageCategoriesController < ApplicationController

  def new
		@message_categories = MessageCategory.new
		@message = Message.find_by(id: params[:message_id])
		@categories = Category.find_by(id: params[:category_id])
		@message_categories.message_id = @message.id
	end

	def create
		@message = Message.find_by(id: params[:message_id])
		@categories = Category.find_by(id: params[:category_id])
		@message_categories = @message.message_categories.new(message_categories_params)
		if @message_categories.save
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end


  private

  def message_categories_params
    params.require(:message_categories).permit(:message_id, :category_id)
  end

end
