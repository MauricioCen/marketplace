# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    let!(:users) { create_list(:user, 10) }

    it 'should return status code 200' do
      get '/users', params: { page: 1, size: 5 }
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /users/:id' do
    let!(:user) { create(:user) }
    it 'should return user' do
      get "/users/#{user.id}"
      payload = JSON.parse(response.body)
      expect(payload['id']).to eq(user.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /users' do
    let!(:user) { create(:user) }
    it 'should create user' do
      body = { user: { name: FFaker::Name.first_name, last_name: FFaker::Name.last_name,
                       email: FFaker::Internet.email } }
      post '/users', params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:user][:name])
      expect(payload['last_name']).to eq(body[:user][:last_name])
      expect(payload['email']).to eq(body[:user][:email])
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT /users/:id' do
    let!(:user) { create(:user) }
    it 'should update user' do
      body = { user: { name: FFaker::Name.first_name, last_name: FFaker::Name.last_name,
                       email: FFaker::Internet.email } }
      put "/users/#{user.id}", params: body
      payload = JSON.parse(response.body)
      expect(payload['name']).to eq(body[:user][:name])
      expect(payload['last_name']).to eq(body[:user][:last_name])
      expect(payload['email']).to eq(body[:user][:email])
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /users/:id' do
    let!(:user) { create(:user) }
    it 'should delete user' do
      delete "/users/#{user.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
