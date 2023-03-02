# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController do
  let!(:category) { create(:category) }

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: category.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'renders the edit template' do
      get :edit, params: { id: category.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'changes count of Categories' do
        expect do
          post :create, params: { category: { name: 'Name', description: 'Description' } }
        end.to change(Category, :count).by(1)
      end

      it 'redirects to created category' do
        post :create, params: { category: { name: 'Name', description: 'Description' } }
        expect(response).to redirect_to(category_url(Category.last))
      end
    end

    context 'with invalid attributes' do
      it 'does not create category' do
        expect do
          post :create, params: { category: { name: nil } }
        end.not_to change(Category, :count)
      end

      it 're-renders new template' do
        expect(post(:create, params: { category: { name: nil } })).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'redirects the show template' do
        patch :update, params: { id: category.id, category: { name: 'Name', description: 'Description' } }

        expect(response).to redirect_to(category_url(category))
      end
    end

    context 'with invalid attributes' do
      it 'renders :edit' do
        patch :update, params: { id: category.id, category: { name: nil, description: nil } }

        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys category' do
      expect { delete(:destroy, params: { id: category.id }) }.to change(Category, :count).by(-1)
    end

    it 'redirects to categories_url' do
      expect(delete(:destroy, params: { id: category.id })).to redirect_to(categories_url)
    end
  end
end
