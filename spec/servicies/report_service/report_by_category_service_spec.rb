# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportService::ReportByCategoryService, type: :service do
  describe '#call' do
    subject(:filtered_data) { described_class.new(params:).call }

    let!(:category_smartphones) { create(:category, :smartphones) }
    let(:category_laptop) { create(:category, :laptops) }

    let!(:operation_iphone) { create(:operation, :iphone) }
    let(:operation_mac_book) { create(:operation, :mac_book) }

    context 'when filtering by all proper params' do
      let(:params) { { 'operation' => { 'category_id' => category_smartphones.id } } }

      it 'returns the operations that belong to the specific category' do
        expect(filtered_data[:operations]).to contain_exactly(operation_iphone)
      end
    end
  end
end
