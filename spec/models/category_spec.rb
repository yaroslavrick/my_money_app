# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  let!(:category) { create(:category, name: 'Test') }

  context 'when presence validation' do
    it 'is valid with valid attributes' do
      expect(category).to be_valid
    end

    it 'not valid without name' do
      category.name = nil
      expect(category).not_to be_valid
    end

    it 'returns error without name' do
      category.name = nil
      category.valid?
      expect(category.errors[:name]).to include("can't be blank")
    end

    it 'not valid without description' do
      category.description = nil
      expect(category).not_to be_valid
    end

    it 'returns error without description' do
      category.description = nil
      category.valid?
      expect(category.errors[:description]).to include("can't be blank")
    end
  end

  describe 'ActiveRecord matchers' do
    it { is_expected.to have_many(:operations).dependent(:delete_all) }
  end

  describe 'uniqueness validation' do
    let(:category_same_name) { build(:category, name: 'Test') }

    it 'not be valid' do
      expect(category_same_name).not_to be_valid
    end

    it 'has an error on when uniqueness validation fails' do
      category_same_name.valid?
      expect(category_same_name.errors[:name]).to include('has already been taken')
    end
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:description) }
  end

  describe 'find_category_name_by_params' do
    it 'finds category_name when id present' do
      expect(described_class.find_category_name_by_params(category.id)).to eq('Test')
    end

    it 'returns nil if id.blank?' do
      expect(described_class.find_category_name_by_params(nil)).to be_nil
    end
  end
end
