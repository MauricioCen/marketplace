# frozen_string_literal: true

class BannersController < ApplicationController
  def index
    _pagy, banners = pagy(Banner.all, items: params[:size])
    render json: banners
  end
end
