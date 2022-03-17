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
end
