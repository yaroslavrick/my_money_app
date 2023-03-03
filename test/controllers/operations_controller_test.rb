# frozen_string_literal: true

require 'test_helper'

class OperationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operation = operations(:one)
  end

  test 'should get index' do
    get operations_url
    assert_response :success
  end

  test 'should get new' do
    get new_operation_url
    assert_response :success
  end

  test 'should create operation' do
    assert_difference('Operation.count') do
      post operations_url,
           params: { operation: { amount: @operation.amount, category_id: @operation.category_id,
                                  description: @operation.description,
                                  odate: @operation.odate } }
    end

    assert_redirected_to operation_url(Operation.last)
  end

  test 'should show operation' do
    get operation_path(id: @operation.id)
    assert_response :success
  end

  test 'should get edit' do
    get edit_operation_path(id: @operation.id)
    assert_response :success
  end

  test 'should update operation' do
    patch operation_path(id: @operation.id),
          params: { operation: { amount: @operation.amount, category_id: @operation.category_id,
                                 description: @operation.description,
                                 odate: @operation.odate } }
    assert_redirected_to operation_path(@operation)
  end

  test 'should destroy operation' do
    assert_difference('Operation.count', -1) do
      delete operation_path(id: @operation.id)
    end

    assert_redirected_to operations_url
  end
end
