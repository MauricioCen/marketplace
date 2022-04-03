# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categories/products', type: :request do
  describe 'GET /categories/:category_id/products' do
    let!(:category) { create(:category) }
    let!(:product_one) { create(:product, category_id: category.id, name: 'PC Gamer') }
    let!(:product_two) { create(:product, category_id: category.id, name: 'Foco') }
    let!(:product_three) { create(:product, category_id: category.id, name: 'Foco2') }
    let!(:product_four) { create(:product, category_id: category.id, name: 'PC Gamer2') }
    let!(:product_five) { create(:product, category_id: category.id, name: 'Foco3') }

    it 'should return products' do
      get "/categories/#{category.id}/products", params: { page: 1, size: 10 }
      payload = JSON.parse(response.body)['products']
      expect(payload.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end
    it 'should return 3 products' do
      get '/products', params: { q: 'Foco' }
      payload = JSON.parse(response.body)['products']
      expect(payload.size).to eq(3)
      expect(response).to have_http_status(:ok)
    end
  end
end
