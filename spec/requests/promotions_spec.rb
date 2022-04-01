# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'promotions', type: :request do
  describe 'GET /promotions' do
    let!(:product_one) { create(:product, discount: 1) }
    let!(:product_two) { create(:product, discount: 3) }
    let!(:product_three) { create(:product, discount: 5) }
    let!(:product_four) { create(:product, discount: 7) }
    let!(:product_five) { create(:product, discount: 9) }
    let!(:product_six) { create(:product, discount: 0) }

    it 'should return status code 200' do
      get '/promotions', params: { page: 1, size: 10 }
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(5)
      expect(response).to have_http_status(:ok)
    end
  end
end
