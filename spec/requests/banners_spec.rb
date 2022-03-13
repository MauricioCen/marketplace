# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Banners', type: :request do
  describe 'GET /banners' do
    let!(:banners) { create_list(:banner, 10) }

    it 'should return status code 200' do
      get '/banners'
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(10)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /Banners' do
    let!(:banner) { create(:banner) }

    it 'should return banner' do
      get "/banners/#{banner.id}"
      payload = JSON.parse(response.body)
      expect(payload['id']).to eq(banner.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /Banners' do
    it 'should create banner' do
      body = { banner: { name: FFaker::Lorem.word } }
      post '/banners', params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:banner][:name])
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /banners' do
    let!(:banner) { create(:banner) }
    it 'should update banner' do
      body = { banner: { name: FFaker::Lorem.word } }
      put "/banners/#{banner.id}", params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:banner][:name])
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /banner/:id' do
    let!(:banner) { create(:banner) }
    it 'should delete banner' do
      delete "/banners/#{banner.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
