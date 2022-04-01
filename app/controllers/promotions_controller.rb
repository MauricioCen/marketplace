# frozen_string_literal: true

class PromotionsController < ApplicationController
  def index
    _pagy, products = pagy(Product.where('discount > 0'), items: params[:size])
    render json: products
  end
end
