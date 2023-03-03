# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'return false if name is missed' do
    new_category = Category.new(description: 'Test description')
    assert_not(new_category.valid?)
  end

  test 'return true if everything is okay' do
    new_category = Category.new(name: 'Test name', description: 'Test description')
    assert(new_category.valid?)
  end

  test 'saving and gathering' do
    new_category = Category.new(name: 'Test name', description: 'Test description')
    new_category.save
    new_cat = Category.find_by(name: 'Test name')
    assert_equal('Test description', new_cat.description)
  end

  test "testing fixtures/categories. Check the 'TestName' from database" do
    category_first = Category.find_by(name: 'TestName')
    assert_equal('MyDescription', category_first.description)
    assert_equal('TestName', category_first.name)
  end

  test "Check the 'Category_name9' from db" do
    category_nine = Category.find_by(name: 'Category_name_9')
    assert_equal('description_9', category_nine.description)
    assert_equal('Category_name_9', category_nine.name)
  end

  test 'return false if name of category is not unique' do
    test_category = Category.new(name: 'uniq', description: 'test descr')
    test_category.save
    not_uniq_category = Category.new(name: 'uniq', description: 'some descr')
    assert_not(not_uniq_category.valid?)
  end

  test 'return true if name of category is unique' do
    test_category = Category.new(name: 'uniq', description: 'test descr')
    test_category.save
    not_uniq_category = Category.new(name: 'uniq2', description: 'some descr')
    assert(not_uniq_category.valid?)
  end

  test "return false if 'description' is missed" do
    test_category = Category.new(name: 'uniq')
    assert_not(test_category.valid?)
  end
end
