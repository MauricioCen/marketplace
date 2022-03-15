# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    _pagy, products = pagy(Product.all, items: params[:size])
    render json: products
  end

  def show
    product = Product.find(params[:id])
    render json: product
  end

  def create
    product = Product.create!(create_params)
    render json: product, status: :created
  end

  def update
    product = Product.find(params[:id])
    product.update!(update_params)
    render json: product, status: :ok
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy!
    render json: product, status: :no_content
  end

  private

  def create_params
    params.require(:product).permit(:name, :description, :price, :discount, :stock, :category_id)
  end

  def update_params
    params.require(:product).permit(:name, :description, :price, :discount, :stock, :category_id)
  end
end
