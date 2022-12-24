# frozen_string_literal: true

# class containing categories CRUD methods
class CategoriesController < ApplicationController

  def show
    binding.pry 
    @category = Category.find(params[:id])
  end

  def create
    binding.pry 
    @category = Category.create(category_params)
    if @category.save
      redirect_to 'messages/show'
    else
      flash[:notice] = 'Unable to save categories. Please try again.'
      redirect_to 'messages/new'
    end
  end

  def index
    binding.pry 
    @categories = Category.all 
  end

  private

  def category_params
    binding.pry 
    params.require(:category).permit(:category, :id)
  end
end
