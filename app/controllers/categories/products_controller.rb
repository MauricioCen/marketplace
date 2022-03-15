# frozen_string_literal: true

module Categories
  class ProductsController < ApplicationController
    def index
      _pagy, products = pagy(Product.where(category_id: params[:category_id]), items: params[:size])
      render json: products
    end
  end
end
