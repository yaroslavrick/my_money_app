# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportService::ReportByCategoryService, type: :service do
  describe '.call' do
    subject(:filtered_data) { described_class.new(params:).call }

    let(:category_smartphones) { create(:category, :smartphones) }
    let(:category_laptop) { create(:category, :laptops) }

    let!(:operation_iphone) { create(:operation, :iphone, category: category_smartphones) }
    let(:operation_mac_book) { create(:operation, :mac_book, category: category_laptop) }

    let(:params) { { 'operation' => { 'category_id' => category_smartphones.id } } }

    context 'when filtering by category_id' do
      it 'returns the operations that belong to the specific category' do
        expect(filtered_data[:operations]).to contain_exactly(operation_iphone)
      end

      it 'returns amounts' do
        expect(filtered_data[:amounts]).to contain_exactly(operation_iphone.amount)
      end

      it 'returns dates' do
        expect(filtered_data[:dates]).to contain_exactly(operation_iphone.odate)
      end

      it 'returns category_name' do
        expect(filtered_data[:category_name]).to eq(category_smartphones.name)
      end
    end
  end
end
