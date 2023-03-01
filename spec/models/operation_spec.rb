# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operation do
  let(:operation_iphone) { build(:operation, :iphone, category: category_phones) }
  let(:category_phones) { create(:category) }

  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to validate_presence_of(:amount) }
  end

  describe 'when validation types' do
    it 'valid with amount greater_then AMOUNT_FIELD_MIN_NUM' do
      expect(build(:operation, amount: described_class::AMOUNT_FIELD_MIN_NUM + 1,
                               category: category_phones)).to be_valid
    end

    context 'when amount is not valid with less_then_or_equal to AMOUNT_FIELD_MIN_NUM' do
      let(:operation) do
        build(:operation, amount: described_class::AMOUNT_FIELD_MIN_NUM,
                          category: category_phones)
      end

      it 'returns error when amount is less_then_or_equal to AMOUNT_FIELD_MIN_NUM' do
        operation.valid?
        expect(operation.errors[:amount]).to include("must be greater than #{described_class::AMOUNT_FIELD_MIN_NUM}")
      end

      it 'not valid with amount less_then_or_equal to AMOUNT_FIELD_MIN_NUM' do
        expect(build(:operation, amount: described_class::AMOUNT_FIELD_MIN_NUM,
                                 category: category_phones)).not_to be_valid
      end
    end
  end

  describe '.find_operation_by_category' do
    context 'when category_id is present' do
      let(:category_food) { create(:category) }
      let(:category_phones) { create(:category) }
      let(:operation_milk) { create(:operation, category: category_food) }
      let(:operation_xiaomi) { create(:operation, category: category_phones) }

      it 'returns proper operations list' do
        expect(described_class.find_operation_by_category(category_food.id)).to eq([operation_milk])
      end

      it 'returns nil when category_id == nil' do
        expect(described_class.find_operation_by_category(nil)).to be_nil
      end
    end
  end

  describe '.find_operations_by_date' do
    context 'when date_from and date_to proper' do
      let(:operation_milk) { create(:operation, odate: '2023-01-21') }
      let(:operation_xiaomi) { create(:operation, odate: '2023-02-02') }

      it 'returns proper operations list' do
        expect(described_class.find_operations_by_date('2023-01-01', '2023-01-31')).to include(operation_milk)
      end

      it 'returns nil if odate from and odate to is less then in particular operations' do
        expect(described_class.find_operations_by_date('2022-01-01', '2022-01-31')).to be_blank
      end
    end
  end

  describe 'pagination' do
    it 'paginates operations by PAGINATION_PAGES' do
      expect(described_class.default_per_page).to eq(described_class::PAGINATION_PAGES)
    end
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:amount) }
    it { is_expected.to have_db_column(:odate) }
    it { is_expected.to have_db_column(:description) }
    it { is_expected.to have_db_column(:category_id) }
  end
end
