# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OperationsController do
  let!(:operation) { create(:operation) }

  describe 'GET#index' do
    before { get :index }

    it 'assigns @operations with paginated list of operations' do
      expect(assigns(:operations)).to eq(Operation.page(1))
    end

    it '@operations with paginated is an ActiveRecord::Relation' do
      expect(assigns(:operations)).to be_a(ActiveRecord::Relation)
    end

    it 'renders template #index' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET#show' do
    it 'renders template #show' do
      get :show, params: { id: operation.id }

      expect(response).to render_template(:show)
    end
  end

  describe 'GET#new' do
    before { get :new }

    it 'renders template #new' do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET#edit' do
    before { get :edit, params: { id: operation.id } }

    it 'renders #edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST#create' do
    context 'when valid attributes' do
      let(:category) { create(:category) }

      it 'saves category and Category count + 1' do
        expect do
          post :create,
               params: { operation: { amount: 1, description: 'Description', odate: Time.zone.today,
                                      category_id: category.id } }
        end.to change(Operation, :count).by(1)
      end

      it 'redirects to operation_url(operation)' do
        post :create,
             params: { operation: { amount: 1, description: 'Description', odate: Time.zone.today,
                                    category_id: category.id } }

        expect(response).to redirect_to(operation_path(Operation.last))
      end
    end

    context 'when invalid attributes' do
      it 'renders #new' do
        post :create, params: { operation: { amount: nil, description: nil, odate: nil, category: nil } }

        expect(response).to render_template(:new)
      end

      it 'returns unprocessable_entity status' do
        post :create,
             params: { operation: { amount: 1, description: nil, odate: nil, category_id: nil } }

        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe 'PATCH#update' do
    context 'when valid attributes' do
      let(:category) { create(:category) }

      before do
        patch :update, params: { id: operation.id, operation: { amount: 2,
                                                                description: 'New description', odate: Time.zone.today,
                                                                category_id: category.id } }
      end

      it 'updates amount attribute of particular operation' do
        operation.reload
        expect(operation[:amount]).to eq(2)
      end

      it 'updates description attribute of particular operation' do
        operation.reload
        expect(operation[:description]).to eq('New description')
      end

      it 'redirects to operation_url(:operation)' do
        expect(response).to redirect_to(operation_url(operation))
      end
    end

    context 'when invalid attributes' do
      let(:category) { create(:category) }

      before do
        patch :update, params: { id: operation.id, operation: { amount: nil,
                                                                description: nil, odate: nil,
                                                                category_id: nil } }
      end

      it 'renders #edit' do
        expect(response).to render_template(:edit)
      end

      it 'returns status :unprocessable_content' do
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe 'PUT#update' do
    context 'when valid attributes' do
      let(:category) { create(:category) }

      before do
        put :update, params: { id: operation.id, operation: { amount: 2,
                                                              description: 'New description', odate: Time.zone.today,
                                                              category_id: category.id } }
      end

      it 'updates amount attribute of particular operation' do
        operation.reload
        expect(operation[:amount]).to eq(2)
      end

      it 'updates description attribute of particular operation' do
        operation.reload
        expect(operation[:description]).to eq('New description')
      end

      it 'redirects to operation_url(:operation)' do
        expect(response).to redirect_to(operation_url(operation))
      end
    end

    context 'when invalid attributes' do
      let(:category) { create(:category) }

      before do
        put :update, params: { id: operation.id, operation: { amount: nil,
                                                              description: nil, odate: nil,
                                                              category_id: nil } }
      end

      it 'renders #edit' do
        expect(response).to render_template(:edit)
      end

      it 'returns status :unprocessable_content' do
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe 'DELETE#destroy' do
    it 'destroy operation' do
      expect do
        delete :destroy, params: { id: operation.id }
      end.to change(Operation, :count).by(-1)
    end

    it 'redirects to operations_url' do
      delete :destroy, params: { id: operation.id }

      expect(response).to redirect_to(operations_url)
    end
  end
end
