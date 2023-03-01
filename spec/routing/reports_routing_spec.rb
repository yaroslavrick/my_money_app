# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportsController do
  describe 'routing' do
    let(:operation) { create(:operation) }

    it 'routes to #report_by_category' do
      expect(get: 'reports/report_by_category').to route_to('reports#report_by_category')
    end

    it 'routes to #report_period_by_categories' do
      expect(get: 'reports/report_period_by_categories').to route_to('reports#report_period_by_categories')
    end

    it 'routes to #report_period_by_dates' do
      expect(get: 'reports/report_period_by_dates').to route_to('reports#report_period_by_dates')
    end

    it 'routes to #create_report_by_dates' do
      expect(get: 'reports/create_report_by_dates').to route_to('reports#create_report_by_dates')
    end

    it 'routes to #create_report_by_category' do
      expect(get: 'reports/create_report_by_category').to route_to('reports#create_report_by_category')
    end
  end
end
