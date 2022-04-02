# frozen_string_literal: true

module Categories
  class ProductsController < ApplicationController
    def index
      pagy, products = pagy(Product.where(category_id: params[:category_id]), items: params[:size])
      render json: products, meta: pagy_metadata(pagy)
    end
  end
end
