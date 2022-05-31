# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Informations', type: :request do
  describe 'GET /informations/:id' do
    let!(:information) { create(:information) }

    it 'should return information' do
      get "/informations/#{information.id}"
      payload = JSON.parse(response.body)['information']
      expect(payload['id']).to eq(information.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
