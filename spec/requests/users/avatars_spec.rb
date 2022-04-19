# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'avatars', type: :request do
  describe 'POST users/:user_id/avatar' do
    let!(:user) { create(:user) }

    it 'should create avatar' do
      body = { avatar: { url: FFaker::Internet.http_url, user_id: user.id } }

      post "/users/#{user.id}/avatar", params: body
      payload = JSON.parse(response.body)['avatar']
      expect(payload['url']).to eq(body[:avatar][:url])
      expect(payload['user']['id']).to eq(body[:avatar][:user_id])
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT users/:user_id/avatar' do
    let!(:user) { create(:user) }
    let!(:avatar) { create(:avatar, user: user) }

    it 'should update avatar' do
      body = { avatar: { url: FFaker::Internet.http_url, user_id: user.id } }

      put "/users/#{user.id}/avatar", params: body
      payload = JSON.parse(response.body)['avatar']
      expect(payload['url']).to eq(body[:avatar][:url])
      expect(payload['user']['id']).to eq(body[:avatar][:user_id])
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE user/:id/avatar' do
    let!(:user) { create(:user) }
    let!(:avatar) { create(:avatar, user: user) }
    it 'should delete avatar' do
      delete "/users/#{user.id}/avatar"
      expect(response).to have_http_status(:no_content)
    end
  end
end
