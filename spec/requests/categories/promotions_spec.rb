# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categories/promotions', type: :request do
  describe 'GET /categories/:category_id/promotions' do
    let!(:category) { create(:category) }
    let!(:product_one) { create(:product, category_id: category.id, discount: 1, name: 'Foco1') }
    let!(:product_two) { create(:product, category_id: category.id, discount: 3, name: 'Foco2') }
    let!(:product_three) { create(:product, category_id: category.id, discount: 5, name: 'Foco3') }
    let!(:product_four) { create(:product, category_id: category.id, discount: 7, name: 'PC Gamer1') }
    let!(:product_five) { create(:product, category_id: category.id, discount: 9, name: 'Pc Gamer2') }

    it 'should return products' do
      get "/categories/#{category.id}/promotions", params: { page: 1, size: 10 }
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end
    it 'should return 3 promotions' do
      get '/promotions', params: { q: 'Foco' }
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(3)
      expect(response).to have_http_status(:ok)
    end
  end
end
