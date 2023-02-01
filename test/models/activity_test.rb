require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "return false if 'atype' missed" do
    new_activity = Activity.new
    assert_not(new_activity.valid?)
  end

  test "return true if everything is okay" do
    new_activity = Activity.new(atype: "a_one")
    assert(new_activity.valid?)
  end

  test "return false if 'atype' is not uniq" do
    new_activity = Activity.new(atype: "a_one")
    new_activity.save
    not_uniq_activity = Activity.new(atype: "a_one")
    assert_not(not_uniq_activity.valid?)
  end

  test "return true if 'atype' is uniq" do
    new_activity = Activity.new(atype: "a_one")
    new_activity.save
    uniq_activity = Activity.new(atype: "a_two")
    assert(uniq_activity.valid?)
  end
end
