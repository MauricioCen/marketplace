# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'promotions', type: :request do
  describe 'GET /promotions' do
    let!(:product_one) { create(:product, discount: 1, name: 'PC Gamer') }
    let!(:product_two) { create(:product, discount: 3, name: 'Laptop') }
    let!(:product_three) { create(:product, discount: 5, name: 'PC Gamer2') }
    let!(:product_four) { create(:product, discount: 7, name: 'Laptop2') }
    let!(:product_five) { create(:product, discount: 9, name: 'Teclado') }
    let!(:product_six) { create(:product, discount: 0, name: 'Mouse') }

    it 'should return 5 promotions' do
      get '/promotions', params: { page: 1, size: 10 }
      payload = JSON.parse(response.body)['products']
      expect(payload.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end
    it 'should return 2 promotions' do
      get '/promotions', params: { q: 'PC Gamer' }
      payload = JSON.parse(response.body)['products']
      expect(payload.size).to eq(2)
      expect(response).to have_http_status(:ok)
    end
  end
end
