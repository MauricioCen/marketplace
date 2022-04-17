# frozen_string_literal: true

class PromotionsController < ApplicationController
  def index
    index_ctx = Promotions::Index.call(params: index_params.to_h)
    pagy, products = pagy(index_ctx.query, items: params[:size])
    render json: products, meta: pagy_metadata(pagy)
  end

  private

  def index_params
    params.permit(:q)
  end
end
