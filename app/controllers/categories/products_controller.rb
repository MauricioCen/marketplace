# frozen_string_literal: true

module Categories
  class ProductsController < ApplicationController
    def index
      promotions = Product.where(category_id: params[:category_id])
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
end
