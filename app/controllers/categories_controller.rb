class CategoriesController < ApplicationController

  def new
    @categories = Category.all
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to 'messages/show'
    else
      redirect_to 'messages/new'
  end

  private

    def category_params # a message must have a bod, title, and user_id
      params.require(:category).permit(:category)
    end


  end
