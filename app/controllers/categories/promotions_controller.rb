# frozen_string_literal: true

module Categories
  class PromotionsController < ApplicationController
    def index
      index_ctx = Categories::Promotions::Index.call(params: index_params.to_h, discount: 0)
      pagy, products = pagy(index_ctx.query, items: params[:size])
      render json: products, meta: pagy_metadata(pagy)
    end

    private

    def index_params
      params.permit(:q, :category_id)
    end
  end
end
