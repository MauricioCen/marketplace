# frozen_string_literal: true

class BannersController < ApplicationController
  def index
    pagy, banners = pagy(Banner.all, items: params[:size])
    render json: banners, meta: pagy_metadata(pagy)
  end
end
