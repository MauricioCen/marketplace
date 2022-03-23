# frozen_string_literal: true

class ContactsController < ApplicationController
  def index
    _pagy, contacts = pagy(Contact.all, items: params[:size])
    render json: contacts
  end

  def show
    contact = Contact.find(params[:id])
    render json: contact
  end

  def create
    contact = Contact.create(create_params)
    render json: contact, status: :created
  end

  def update
    contact = Contact.find(params[:id])
    contact.update!(update_params)
    render json: contact, status: :ok
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: contact, status: :no_content
  end

  private

  def create_params
    params.require(:contact).permit(:name, :last_name, :phone_number, :secret_key, :user_id)
  end

  def update_params
    params.require(:contact).permit(:name, :last_name, :phone_number, :secret_key, :user_id)
  end
end