# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /products' do
    let!(:product) { create_list(:product, 10) }

    it 'should return status code 200' do
      get '/products', params: { page: 1, size: 5 }
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /products/:id' do
    let!(:product) { create(:product) }

    it 'should return product' do
      get "/products/#{product.id}"
      payload = JSON.parse(response.body)
      expect(payload['id']).to eq(product.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
