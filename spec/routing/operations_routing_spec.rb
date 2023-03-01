# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OperationsController do
  describe 'routing' do
    let(:operation) { create(:operation) }

    it 'routes to #index' do
      expect(get: '/operations').to route_to('operations#index')
    end

    it 'routes to #create' do
      expect(post: '/operations').to route_to('operations#create')
    end

    it 'routes to #new' do
      expect(get: '/operations/new').to route_to('operations#new')
    end

    it 'routes to #edit' do
      expect(get: "/operations/#{operation.id}/edit").to route_to('operations#edit', id: operation.id.to_s)
    end

    it 'routes to #show' do
      expect(get: "/operations/#{operation.id}").to route_to('operations#show', id: operation.id.to_s)
    end

    it 'routes to #update with PATCH' do
      expect(patch: "/operations/#{operation.id}").to route_to('operations#update', id: operation.id.to_s)
    end

    it 'routes to #update with PUT' do
      expect(put: "/operations/#{operation.id}").to route_to('operations#update', id: operation.id.to_s)
    end

    it 'routes to #destroy with PUT' do
      expect(delete: "/operations/#{operation.id}").to route_to('operations#destroy', id: operation.id.to_s)
    end
  end
end
