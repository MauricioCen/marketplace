# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'banners', type: :request do
  describe 'GET /banners' do
    let!(:banners) { create_list(:banner, 10) }

    it 'should return status code 200' do
      get '/banners', params: { page: 1, size: 5 }
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /banners' do
    let!(:banner) { create(:banner) }

    it 'should return banner' do
      get "/banners/#{banner.id}"
      payload = JSON.parse(response.body)
      expect(payload['id']).to eq(banner.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /banners' do
    it 'should create banner' do
      body = { banner: { name: FFaker::Lorem.word } }
      post '/banners', params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:banner][:name])
      expect(payload['link']).to eq(body[:banner][:link])
      expect(payload['url']).to eq(body[:banner][:url])
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /banners' do
    let!(:banner) { create(:banner) }
    it 'should update banner' do
      body = { banner: { name: FFaker::Lorem.word, link: FFaker::Internet.http_url, url: FFaker::Internet.http_url } }
      put "/banners/#{banner.id}", params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:banner][:name])
      expect(payload['link']).to eq(body[:banner][:link])
      expect(payload['url']).to eq(body[:banner][:url])
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /banners/:id' do
    let!(:banner) { create(:banner) }
    it 'should delete banner' do
      delete "/banners/#{banner.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
