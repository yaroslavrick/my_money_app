# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test 'should get index' do
    get categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_category_url
    assert_response :success
  end

  test 'should create category' do
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: 'Name', description: 'Description' } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test 'should show category' do
    get category_path(id: @category.id)
    assert_response :success
  end

  test 'should get edit' do
    get edit_category_path(id: @category.id)
    assert_response :success
  end

  test 'should update category' do
    patch category_url(id: @category.id),
          params: { category: { description: @category.description, name: @category.name } }
    assert_redirected_to category_url(@category)
  end

  test 'should destroy category' do
    assert_difference('Category.count', -1) do
      delete category_url(id: @category.id)
    end

    assert_redirected_to categories_url
  end
end
