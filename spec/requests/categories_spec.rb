# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/categories' do
  describe 'GET /index' do
    it 'returns http success' do
      get '/categories#index'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /index' do
    it 'returns http redirect' do
      post '/categories', params: { category: { name: 'Test', description: 'Description' } }

      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/categories/new'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /:id/edit' do
    let(:category) { create(:category) }

    it 'returns http success' do
      get "/categories/#{category.id}/edit"

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /:id' do
    let(:category) { create(:category) }

    it 'returns http success' do
      get "/categories/#{category.id}"

      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /:id' do
    let(:category) { create(:category) }

    before do
      patch "/categories/#{category.id}", params: { category: { name: 'New name', description: 'New description' } }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:redirect)
    end

    it 'changes category.name' do
      category.reload
      expect(category.name).to eq('New name')
    end

    it 'changes category.description' do
      category.reload
      expect(category.description).to eq('New description')
    end
  end

  describe 'PUT /:id' do
    let(:category) { create(:category) }

    before do
      put "/categories/#{category.id}", params: { category: { name: 'New name', description: 'New description' } }
    end

    it 'returns http redirect' do
      expect(response).to have_http_status(:redirect)
    end

    it 'changes category.name' do
      category.reload
      expect(category.name).to eq('New name')
    end

    it 'changes category.description' do
      category.reload
      expect(category.description).to eq('New description')
    end
  end

  describe 'DELETE /:id' do
    let!(:category) { create(:category) }

    it 'deletes category' do
      expect do
        delete "/categories/#{category.id}"
      end.to change(Category, :count).by(-1)
    end

    it 'returns http redirect' do
      delete "/categories/#{category.id}"

      expect(response).to have_http_status(:redirect)
    end
  end
end
