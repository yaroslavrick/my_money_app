# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportsController do
  describe 'POST #report_by_category' do
    context 'when category is selected' do
      let(:category) { create(:category) }
      let(:params) { { operation: { category_id: category.id } } }

      it 'renders the report_by_category template' do
        post(:report_by_category, params:)
        expect(response).to render_template(:report_by_category)
      end
    end

    context 'when category is not selected' do
      before { post(:report_by_category, params: { operation: { category_id: nil } }) }

      it 'redirects to create_report_by_category' do
        expect(response).to redirect_to(reports_create_report_by_category_path)
      end

      it 'returns a 3XX HTTP status code' do
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
