# frozen_string_literal: true

module Users
  class AvatarController < ApplicationController
    def create
      avatar = Avatar.create!(create_params)
      render json: avatar, status: :created
    end

    def update
      user = User.find(params[:user_id])
      user.avatar.update!(update_params)
      render json: user.avatar, status: :ok
    end

    def destroy
      user = User.find(params[:user_id])
      user.avatar.destroy! if user.avatar.present?
      render json: user.avatar, status: :no_content
    end

    private

    def create_params
      params.require(:avatar).permit(:url, :user_id)
    end

    def update_params
      params.require(:avatar).permit(:url)
    end
  end
end
