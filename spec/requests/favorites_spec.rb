# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favorites', type: :request do
  describe 'GET /favorites' do
    let!(:favorites) { create_list(:favorite, 10) }

    it 'should return favorites' do
      get '/favorites', params: { page: 1, size: 5 }
      payload = JSON.parse(response.body)['favorites']
      expect(payload.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /favorites' do
    let!(:user) { create(:user) }
    let!(:product) { create(:product) }

    it 'should return product' do
      body = { favorite: { user_id: user.id, product_id: product.id } }
      post '/favorites', params: body
      payload = JSON.parse(response.body)['favorite']
      expect(payload['id']).to eq(body[:favorite][:user_id])
      expect(payload['id']).to eq(body[:favorite][:product_id])
    end
  end

  describe 'DELETE /favorites/:id' do
    let!(:favorite) { create(:favorite) }

    it 'should delete favorite' do
      delete "/favorites/#{favorite.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
