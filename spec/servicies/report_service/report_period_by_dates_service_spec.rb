# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportService::ReportPeriodByDatesService, type: :service do
  describe '.call' do
    subject(:filtered_data) { described_class.new(params:).call }

    let(:params) { { 'filter' => { 'date-from' => '2023-01-01', 'date-to' => '2023-02-25' } } }
    let(:category_laptops) { create(:category, :laptops) }

    let!(:operation_mac_book) { create(:operation, :mac_book, category: category_laptops) }
    let!(:operation_sony_vaio) { create(:operation, :sony_vaio, category: category_laptops) }

    context 'when filtering by dates' do
      it 'returns total_sum' do
        expected_result = operation_mac_book.amount + operation_sony_vaio.amount
        expect(filtered_data[:total_sum]).to eq(expected_result)
      end

      it 'returns categories_and_total_amount'
      it 'returns categories_names'
      it 'returns total_amounts'
    end
  end
end
