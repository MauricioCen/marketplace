# frozen_string_literal: true

module Categories
  class ProductsController < ApplicationController
    def index
      products = Product.where(category_id: params[:category_id])
      render json: products
    end
  end
end
