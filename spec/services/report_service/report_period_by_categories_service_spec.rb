# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportService::ReportPeriodByCategoriesService, type: :service do
  describe '.call' do
    subject(:filtered_data) { described_class.new(params:).call }

    let(:params) { { 'filter' => { 'date-from' => '2023-01-01', 'date-to' => '2023-02-25' } } }
    let(:category_laptops) { create(:category, :laptops) }

    let(:operation_mac_book) { create(:operation, :mac_book, category: category_laptops) }
    let!(:operation_sony_vaio) { create(:operation, :sony_vaio, category: category_laptops) }
    let!(:operation_lenovo) { create(:operation, :lenovo, category: category_laptops) }

    context 'when filtering by categories' do
      it 'returns total_sum' do
        expected_result = operation_sony_vaio.amount + operation_lenovo.amount
        expect(filtered_data[:total_sum]).to eq(expected_result)
      end

      it 'returns categories_and_total_amount for chart' do
        expected_result = { category_laptops.name => operation_sony_vaio.amount + operation_lenovo.amount }

        expect(filtered_data[:categories_and_total_amount]).to eq(expected_result)
      end

      it 'returns proper categories_names for table data' do
        expected_result = [category_laptops.name]

        expect(filtered_data[:categories_names]).to eq(expected_result)
      end

      it 'returns total_amounts for table data' do
        expected_result = [operation_sony_vaio.amount + operation_lenovo.amount]

        expect(filtered_data[:total_amounts]).to eq(expected_result)
      end
    end
  end
end
