require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test"return false if name is missed" do
    new_category = Category.new(description: "Test description")
    assert_not(new_category.valid?)
  end

  test "return true if everything is okay" do
    new_category = Category.new(name: "Test name", description: "Test description")
    assert(new_category.valid?)
  end

  test "saving and gathering" do
    new_category = Category.new(name: "Test name", description: "Test description")
    new_category.save
    new_cat = Category.find_by(name: "Test name")
    assert_equal("Test description", new_cat.description)
  end

  test "testing fixtures/categories. Check the '1st_Category' from database" do
    category_first = Category.find_by(name: 'MyString')
    assert_equal('MyString', category_first.name)
  end
end
