# frozen_string_literal: true

class AddressesController < ApplicationController
  def index
    _pagy, addresses = pagy(Address.all, items: params[:size])
    render json: addresses
  end

  def show
    address = Address.find(params[:id])
    render json: address
  end

  def create
    address = Address.create(create_params)
    render json: address, status: :created
  end

  def update
    address = Address.find(params[:id])
    address.update!(update_params)
    render json: address, status: :ok
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy!
    render json: address, status: :no_content
  end

  private

  def create_params
    params.require(:address).permit(:name, :first_address, :int_number, :ext_number, :zip_code, :references, :city, :state, :user_id)
  end

  def update_params
    params.require(:address).permit(:name, :first_address, :int_number, :ext_number, :zip_code, :references, :city, :state, :user_id)
  end
end
