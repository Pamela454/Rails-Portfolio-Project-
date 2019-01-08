class CategoryController < ApplicationController

  private

    def category_params # a message must have a bod, title, and user_id
      params.require(:category).permit(:category)
    end


  end
