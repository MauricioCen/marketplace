# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    index_ctx = Promotions::Products::Index.call(params: index_params.to_h)
    pagy, products = pagy(index_ctx.query, items: params[:size])
    render json: products, meta: pagy_metadata(pagy)
  end

  def show
    product = Product.friendly.find(params[:id])
    render json: product
  end

  private

  def index_params
    params.permit(:q)
  end
end
