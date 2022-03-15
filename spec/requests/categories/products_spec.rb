# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categories/products', type: :request do
  describe 'GET /categories/:category_id/products' do
    let!(:category) { create(:category) }
    let!(:products) { create_list(:product, 6, category_id: category.id) }

    it 'should return 6 products' do
      get "/categories/#{category.id}/products", params: { page: 1, size: 2 }
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(2)
      expect(response).to have_http_status(:ok)
    end
  end
end
