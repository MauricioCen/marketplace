# frozen_string_literal: true

class FavoritesController < ApplicationController
  def index
    pagy, favorites = pagy(Favorite.all, items: params[:size])
    render json: favorites, meta: pagy_metadata(pagy)
  end

  def create
    favorite = Favorite.create(create_params)
    render json: favorite, status: :created
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy!
    render json: favorite, status: :no_content
  end

  private

  def create_params
    params.require(:favorite).permit(:user_id, :product_id)
  end
end
