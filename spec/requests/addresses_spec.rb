# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'addresses', type: :request do
  describe 'GET /addresses' do
    let!(:addresses) { create_list(:address, 10) }

    it 'should return status code 200' do
      get '/addresses', params: { page: 1, size: 5 }
      payload = JSON.parse(response.body)['addresses']
      expect(payload.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /addresses/:id' do
    let!(:address) { create(:address) }
    it 'should return address' do
      get "/addresses/#{address.id}"
      payload = JSON.parse(response.body)['address']
      expect(payload['id']).to eq(address.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /addresses' do
    let!(:user) { create(:user) }
    it 'should create address' do
      body = { address: { name: FFaker::Lorem.word, first_address: FFaker::Lorem.word, int_number: FFaker::Lorem.word, ext_number: FFaker::Lorem.word,
                          zip_code: FFaker::Lorem.word, references: FFaker::Lorem.paragraph, city: FFaker::Address.city, state: FFaker::Lorem.word, user_id: user.id } }
      post '/addresses', params: body
      payload = JSON.parse(response.body)['address']
      expect(payload['name']).to eq(body[:address][:name])
      expect(payload['first_address']).to eq(body[:address][:first_address])
      expect(payload['int_number']).to eq(body[:address][:int_number])
      expect(payload['ext_number']).to eq(body[:address][:ext_number])
      expect(payload['zip_code']).to eq(body[:address][:zip_code])
      expect(payload['references']).to eq(body[:address][:references])
      expect(payload['city']).to eq(body[:address][:city])
      expect(payload['state']).to eq(body[:address][:state])
      expect(payload['user']['id']).to eq(body[:address][:user_id])
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /addresses/:id' do
    let!(:address) { create(:address) }
    let!(:user) { create(:user) }
    it 'should update address' do
      body = { address: { name: FFaker::Lorem.word, first_address: FFaker::Lorem.word, int_number: FFaker::Lorem.word, ext_number: FFaker::Lorem.word,
                          zip_code: FFaker::Lorem.word, references: FFaker::Lorem.paragraph, city: FFaker::Address.city, state: FFaker::Lorem.word, user_id: user.id } }
      put "/addresses/#{address.id}", params: body
      payload = JSON.parse(response.body)['address']
      expect(payload['name']).to eq(body[:address][:name])
      expect(payload['first_address']).to eq(body[:address][:first_address])
      expect(payload['int_number']).to eq(body[:address][:int_number])
      expect(payload['ext_number']).to eq(body[:address][:ext_number])
      expect(payload['zip_code']).to eq(body[:address][:zip_code])
      expect(payload['references']).to eq(body[:address][:references])
      expect(payload['city']).to eq(body[:address][:city])
      expect(payload['state']).to eq(body[:address][:state])
      expect(payload['user']['id']).to eq(body[:address][:user_id])
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /addresses/:id' do
    let!(:address) { create(:address) }
    it 'should address contact' do
      delete "/addresses/#{address.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
