# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController do
  describe 'routing' do
    let(:category) { create(:category) }

    it 'routes to #index with GET' do
      expect(get: '/categories').to route_to('categories#index')
    end

    it 'routes to #create with POST' do
      expect(post: '/categories').to route_to('categories#create')
    end

    it 'routes to #new with GET' do
      expect(get: '/categories/new').to route_to('categories#new')
    end

    it 'routes to #edit with GET' do
      expect(get: "/categories/#{category.id}/edit").to route_to('categories#edit', id: category.id.to_s)
    end

    it 'routes to #show with GET' do
      expect(get: "/categories/#{category.id}").to route_to('categories#show', id: category.id.to_s)
    end

    it 'routes to #update with PATCH' do
      expect(patch: "/categories/#{category.id}").to route_to('categories#update', id: category.id.to_s)
    end

    it 'routes to #update with PUT' do
      expect(put: "/categories/#{category.id}").to route_to('categories#update', id: category.id.to_s)
    end

    it 'routes to #destroy with DELETE' do
      expect(delete: "/categories/#{category.id}").to route_to('categories#destroy', id: category.id.to_s)
    end
  end
end
