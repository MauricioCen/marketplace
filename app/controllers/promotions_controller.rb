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
    pagy, products = pagy(query, items: params[:size])
    render json: products, meta: pagy_metadata(pagy)
  end
end
