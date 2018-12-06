class MessagesController < ApplicationController


private

  def user_params
    params.require(:title, :body, :user_id)
  end


end
