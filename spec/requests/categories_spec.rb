# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    let!(:categories) { create_list(:category, 10) }

    it 'should return status code 200' do
      get '/categories', params: { page: 1, size: 5 }
      payload = JSON.parse(response.body)['categories']
      expect(payload.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end
  end
end
