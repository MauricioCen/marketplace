# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    pagy, categories = pagy(Category.all, items: params[:size])
    render json: categories, meta: pagy_metadata(pagy)
  end
end
