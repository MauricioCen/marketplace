# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'contacts', type: :request do
  describe 'GET /contacts' do
    let!(:contacts) { create_list(:contact, 10) }

    it 'should return status code 200' do
      get '/contacts', params: { page: 1, size: 5 }
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /contacts/:id' do
    let!(:contact) { create(:contact) }
    it 'should return contact' do
      get "/contacts/#{contact.id}"
      payload = JSON.parse(response.body)
      expect(payload['id']).to eq(contact.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /contacts' do
    let!(:user) { create(:user) }
    it 'should create contact' do
      body = { contact: { name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, phone_number: FFaker::Lorem.word,
                          secret_key: FFaker::Lorem.word, user_id: user.id } }
      post '/contacts', params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:contact][:name])
      expect(payload['last_name']).to eq(body[:contact][:last_name])
      expect(payload['phone_number']).to eq(body[:contact][:phone_number])
      expect(payload['secret_key']).to eq(body[:contact][:secret_key])
      expect(payload['user']['id']).to eq(body[:contact][:user_id])
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /contacts' do
    let!(:contact) { create(:contact) }
    let!(:user) { create(:user) }
    it 'should update contact' do
      body = { contact: { name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, phone_number: FFaker::Lorem.word,
                          secret_key: FFaker::Lorem.word, user_id: user.id } }
      put "/contacts/#{contact.id}", params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:contact][:name])
      expect(payload['last_name']).to eq(body[:contact][:last_name])
      expect(payload['phone_number']).to eq(body[:contact][:phone_number])
      expect(payload['secret_key']).to eq(body[:contact][:secret_key])
      expect(payload['user']['id']).to eq(body[:contact][:user_id])
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /contacts/:id' do
    let!(:contact) { create(:contact) }
    it 'should delete contact' do
      delete "/contacts/#{contact.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
