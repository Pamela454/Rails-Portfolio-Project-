class ResponseController < ApplicationController

  private

    def response_params # a message must have a bod, title, and user_id
      params.require(:response).permit(:response, :physician_id, :message_id)
    end


  end
