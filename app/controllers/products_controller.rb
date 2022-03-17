# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    _pagy, products = pagy(Product.all, items: params[:size])
    render json: products
  end

  def show
    product = Product.friendly.find(params[:id])
    render json: product
  end
end
