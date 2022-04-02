# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /products' do
    let!(:product) { create_list(:product, 10) }
    let!(:product_one) { create(:product, name: 'Comida para perros') }
    let!(:product_two) { create(:product, name: 'Comida para gatos') }

    it 'should return status code 200' do
      get '/products', params: { page: 1, size: 5 }
      payload = JSON.parse(response.body)['products']
      expect(payload.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end

    it 'should return 2 products' do
      get '/products', params: { q: 'Comida' }
      payload = JSON.parse(response.body)['products']
      expect(payload.size).to eq(2)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /products/:id' do
    let!(:product) { create(:product) }

    it 'should return product' do
      get "/products/#{product.id}"
      payload = JSON.parse(response.body)['product']
      expect(payload['id']).to eq(product.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /products/:slug' do
    let!(:product) { create(:product) }
    it 'should return product' do
      get "/products/#{product.slug}"
      payload = JSON.parse(response.body)['product']
      expect(payload['slug']).to eq(product.slug)
      expect(response).to have_http_status(:ok)
    end
  end
end
