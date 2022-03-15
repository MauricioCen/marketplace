# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    _pagy, categories = pagy(Category.all, items: params[:size])
    render json: categories
  end

  def show
    category = Category.find(params[:id])
    render json: category
  end

  def create
    category = Category.create!(create_params)
    render json: category, status: :created
  end

  def update
    category = Category.find(params[:id])
    category.update!(update_params)
    render json: category
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy!
    render json: category, status: :no_content
  end

  private

  def create_params
    params.require(:category).permit(:name)
  end

  def update_params
    params.require(:category).permit(:name)
  end
end
