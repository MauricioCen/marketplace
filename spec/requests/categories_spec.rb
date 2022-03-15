# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    let!(:categories) { create_list(:category, 10) }

    it 'should return status code 200' do
      get '/categories', params: { page: 1, size: 5 }
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /categories/:id' do
    let!(:category) { create(:category) }
    it 'should return category' do
      get "/categories/#{category.id}"
      payload = JSON.parse(response.body)
      expect(payload['id']).to eq(category.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /categories' do
    it 'should create category' do
      body = { category: { name: FFaker::Lorem.word } }
      post '/categories', params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:category][:name])
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /categories/:id' do
    let!(:category) { create(:category) }
    it 'should update category' do
      body = { category: { name: FFaker::Lorem.word } }
      put "/categories/#{category.id}", params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:category][:name])
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /categories/:id' do
    let!(:category) { create(:category) }
    it 'should delete category' do
      delete "/categories/#{category.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
