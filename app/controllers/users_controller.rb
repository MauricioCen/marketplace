# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    _pagy, users = pagy(User.all, items: params[:size])
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.create(create_params)
    render json: user, status: :created
  end

  def update
    user = User.find(params[:id])
    user.update!(update_params)
    render json: user, status: :ok
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    render json: user, status: :no_content
  end

  private

  def create_params
    params.require(:user).permit(:name, :last_name, :email)
  end

  def update_params
    params.require(:user).permit(:name, :last_name, :email)
  end
end
