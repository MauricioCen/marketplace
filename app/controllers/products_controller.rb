# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    query = params[:q]
    products = if query.blank?
                 Product.all
               else
                 Product.search(query)
               end
    pagy, products = pagy(products, items: params[:size])
    render json: products, meta: pagy_metadata(pagy)
  end

  def show
    product = Product.friendly.find(params[:id])
    render json: product
  end
end
