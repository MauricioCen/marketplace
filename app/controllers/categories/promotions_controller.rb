# frozen_string_literal: true

module Categories
  class PromotionsController < ApplicationController
    def index
      _pagy, products = pagy(Product.where(category_id: params[:category_id]).where('discount > 0'), items: params[:size])
      render json: products
    end
  end
end
