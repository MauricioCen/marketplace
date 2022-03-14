# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'assets', type: :request do
  describe 'GET /assets' do
    let!(:assets) { create_list(:asset, 10) }

    it 'should return status code 200' do
      get '/assets'
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(10)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /assets/:id' do
    let!(:asset) { create(:asset) }

    it 'should return asset' do
      get "/assets/#{asset.id}"
      payload = JSON.parse(response.body)
      expect(payload['id']).to eq(asset.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /assets' do
    let!(:product) { create(:product) }
    it 'should create assets' do
      body = { asset: { name: FFaker::Lorem.word, url: FFaker::Internet.http_url, product_id: product.id } }
      post '/assets', params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:asset][:name])
      expect(payload['url']).to eq(body[:asset][:url])
      expect(payload['product']['id']).to eq(body[:asset][:product_id])
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /assets/:id' do
    let!(:asset) { create(:asset) }
    let!(:product) { create(:product) }
    it 'should update asset' do
      body = { asset: { name: FFaker::Lorem.word, url: FFaker::Internet.http_url, product_id: product.id } }
      put "/assets/#{asset.id}", params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:asset][:name])
      expect(payload['url']).to eq(body[:asset][:url])
      expect(payload['product']['id']).to eq(body[:asset][:product_id])
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /assets/:id' do
    let!(:asset) { create(:asset) }
    it 'should delete asset' do
      delete "/assets/#{asset.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
