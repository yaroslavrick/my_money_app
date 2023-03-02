# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MainController do
  describe 'GET#index' do
    let!(:category1) { create(:category) }
    let!(:category2) { create(:category) }
    let!(:operation1) { create(:operation, category: category1) }
    let!(:operation2) { create(:operation, category: category2) }

    before { get :index }

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'assigns @all_operations with all operations' do
      expect(assigns(:all_operations)).to eq([operation1, operation2])
    end

    it 'assigns @all_categories with all categories' do
      expect(assigns(:all_categories)).to eq([category1, category2])
    end

    it 'assigns operations with paginated list of operations' do
      expect(assigns(:operations)).to eq(Operation.page(1))
    end

    it 'assigns categories with paginated list of categories' do
      expect(assigns(:categories)).to eq(Category.page(1))
    end
  end
end
