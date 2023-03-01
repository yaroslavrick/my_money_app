# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/operations' do
  describe 'GET /index' do
    it 'returns http success' do
      get '/operations#index'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    let(:operation) { create(:operation) }

    it 'returns http redirect' do
      post '/operations', params: { operation: { category_id: operation.category_id,
                                                 amount: operation.amount,
                                                 odate: operation.odate,
                                                 description: operation.description } }

      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/operations#new'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /:id/edit' do
    let(:operation) { create(:operation) }

    it 'returns http success' do
      get "/operations/#{operation.id}/edit"

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /:id' do
    let(:operation) { create(:operation) }

    it 'returns http success' do
      get "/operations/#{operation.id}"

      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /:id' do
    let(:operation) do
      create(:operation, amount: 1,
                         odate: Time.zone.today,
                         description: 'Description')
    end

    let(:params) do
      { operation: { category_id: operation.category_id,
                     amount: 2,
                     odate: Time.zone.yesterday,
                     description: 'New description' } }
    end

    before do
      patch("/operations/#{operation.id}", params:)
      operation.reload
    end

    it 'returns http redirect' do
      expect(response).to have_http_status(:redirect)
    end

    it 'changes the amount' do
      expect(operation.amount).to eq(2)
    end

    it 'changes the date' do
      expect(operation.odate).to eq(Time.zone.yesterday)
    end

    it 'changes the description' do
      expect(operation.description).to eq('New description')
    end
  end

  describe 'PUT /:id' do
    let(:operation) do
      create(:operation, amount: 1,
                         odate: Time.zone.today,
                         description: 'Description')
    end

    let(:params) do
      { operation: { category_id: operation.category_id,
                     amount: 2,
                     odate: Time.zone.yesterday,
                     description: 'New description' } }
    end

    before do
      put("/operations/#{operation.id}", params:)
      operation.reload
    end

    it 'returns http redirect' do
      expect(response).to have_http_status(:redirect)
    end

    it 'changes the amount' do
      expect(operation.amount).to eq(2)
    end

    it 'changes the date' do
      expect(operation.odate).to eq(Time.zone.yesterday)
    end

    it 'changes the description' do
      expect(operation.description).to eq('New description')
    end
  end

  describe 'DELETE /:id' do
    let!(:operation) { create(:operation) }

    it 'deletes operation' do
      expect { delete("/operations/#{operation.id}") }.to change(Operation, :count).by(-1)
    end

    it 'returns http redirect' do
      delete("/operations/#{operation.id}")

      expect(response).to have_http_status(:redirect)
    end
  end
end
