# frozen_string_literal: true

module Categories
  class PromotionsController < ApplicationController
    def index
      promotions = Product.where(category_id: params[:category_id]).where('discount > 0')
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
end
