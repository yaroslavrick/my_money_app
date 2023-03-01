# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/reports' do
  describe 'GET /report_by_category' do
    let(:operation) { create(:operation) }

    let(:params) do
      { operation: { category_id: operation.category_id,
                     amount: 2,
                     odate: Time.zone.yesterday,
                     description: 'New description' } }
    end

    it 'returns http success' do
      get('/reports/report_by_category', params:)

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /report_period_by_categories' do
    let(:operation) { create(:operation) }

    let(:params) do
      { filter: { 'date-from': Time.zone.today - 3, 'date-to': Time.zone.today } }
    end

    before do
      get('/reports/report_period_by_categories', params:)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /report_period_by_dates' do
    let(:operation) { create(:operation) }

    let(:params) do
      { filter: { 'date-from': Time.zone.today - 3, 'date-to': Time.zone.today } }
    end

    before do
      get('/reports/report_period_by_dates', params:)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create_report_by_dates' do
    let(:operation) { create(:operation) }

    let(:params) do
      { filter: { 'date-from': Time.zone.today - 3, 'date-to': Time.zone.today } }
    end

    before do
      get('/reports/create_report_by_dates', params:)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create_report_by_category' do
    let(:operation) { create(:operation) }

    let(:params) do
      { filter: { 'date-from': Time.zone.today - 3, 'date-to': Time.zone.today } }
    end

    before do
      get('/reports/create_report_by_category', params:)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
