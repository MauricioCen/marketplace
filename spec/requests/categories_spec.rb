# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    let!(:categories) { create_list(:category, 10) }

    it 'should return status code 200' do
      get '/categories'
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(10)
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
end
