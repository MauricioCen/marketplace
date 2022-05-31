# frozen_string_literal: true

class InformationsController < ApplicationController
  def show
    information = Information.find(params[:id])
    render json: information
  end
end
