# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MainController do
  describe 'GET#index' do
    let!(:category_one) { create(:category) }
    let!(:category_other) { create(:category) }
    let!(:operation_one) { create(:operation, category: category_one) }
    let!(:operation_other) { create(:operation, category: category_other) }

    before { get :index }

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'assigns @all_operations with all operations' do
      expect(assigns(:all_operations)).to eq([operation_one, operation_other])
    end

    it 'assigns @all_categories with all categories' do
      expect(assigns(:all_categories)).to eq([category_one, category_other])
    end

    it 'assigns operations with paginated list of operations' do
      expect(assigns(:operations)).to eq(Operation.page(1))
    end

    it 'assigns categories with paginated list of categories' do
      expect(assigns(:categories)).to eq(Category.page(1))
    end
  end
end
