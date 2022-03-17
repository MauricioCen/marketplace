# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    _pagy, categories = pagy(Category.all, items: params[:size])
    render json: categories
  end
end
