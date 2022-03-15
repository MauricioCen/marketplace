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

  describe 'POST /products' do
    let!(:category) { create(:category) }
    it 'should create products' do
      body = { product: { name: FFaker::Lorem.word, description: FFaker::Lorem.paragraph,
                          price: FFaker::Number.decimal, discount: 0.10, stock: 20, category_id: category.id } }
      post '/products', params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:product][:name])
      expect(payload['description']).to eq(body[:product][:description])
      expect(payload['price']).to eq(body[:product][:price])
      expect(payload['discount']).to eq(body[:product][:discount])
      expect(payload['stock']).to eq(body[:product][:stock])
      expect(payload['category']['id']).to eq(body[:product][:category_id])
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /products/:id' do
    let!(:product) { create(:product) }
    let!(:category) { create(:category) }
    it 'should update products' do
      body = { product: { name: FFaker::Lorem.word, description: FFaker::Lorem.paragraph,
                          price: FFaker::Number.decimal, discount: 0.10, stock: 20, category_id: category.id } }
      put "/products/#{product.id}", params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:product][:name])
      expect(payload['description']).to eq(body[:product][:description])
      expect(payload['price']).to eq(body[:product][:price])
      expect(payload['discount']).to eq(body[:product][:discount])
      expect(payload['stock']).to eq(body[:product][:stock])
      expect(payload['category']['id']).to eq(body[:product][:category_id])
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /products/:id' do
    let!(:product) { create(:product) }
    it 'should delete product' do
      delete "/products/#{product.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
