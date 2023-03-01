# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/').to route_to('main#index')
    end
  end
end
