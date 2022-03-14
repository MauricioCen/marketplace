# frozen_string_literal: true

class AssetsController < ApplicationController
  def index
    assets = Asset.all
    render json: assets
  end

  def show
    asset = Asset.find(params[:id])
    render json: asset
  end

  def create
    asset = Asset.create!(create_params)
    render json: asset, status: :created
  end

  def update
    asset = Asset.find(params[:id])
    asset.update!(update_params)
    render json: asset, status: :ok
  end

  def destroy
    asset = Asset.find(params[:id])
    asset.destroy!
    render json: asset, status: :no_content
  end

  private

  def create_params
    params.require(:asset).permit(:name, :url, :product_id)
  end

  def update_params
    params.require(:asset).permit(:name, :url, :product_id)
  end
end
