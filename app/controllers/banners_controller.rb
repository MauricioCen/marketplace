# frozen_string_literal: true

class BannersController < ApplicationController
  def index
    _pagy, banners = pagy(Banner.all, items: params[:size])
    render json: banners
  end

  def show
    banner = Banner.find(params[:id])
    render json: banner
  end

  def create
    banner = Banner.create!(create_params)
    render json: banner, status: :created
  end

  def update
    banner = Banner.find(params[:id])
    banner.update!(update_params)
    render json: banner, status: :ok
  end

  def destroy
    banner = Banner.find(params[:id])
    banner.destroy!
    render json: banner, status: :no_content
  end

  private

  def create_params
    params.require(:banner).permit(:name, :link, :url)
  end

  def update_params
    params.require(:banner).permit(:name, :link, :url)
  end
end
