# frozen_string_literal: true

class PromotionsController < ApplicationController
  def index
    promotions = Product.where('discount > 0')
    filter = params[:q]
    query = if filter.blank?
              promotions
            else
              promotions.search(filter)
            end
    _pagy, products = pagy(query, items: params[:size])
    render json: products
  end
end
