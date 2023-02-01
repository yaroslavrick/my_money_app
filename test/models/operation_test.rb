require "test_helper"

class OperationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "return true if everything is okay" do
    new_operation = Operation.new(amount: 0.1685620424667173e4,
                                  odate: Time.now.to_s,
                                  description: "Test description",
                                  category_id: 2)
    assert(new_operation.valid?)
  end

  test "return false if missing param 'amount' in operation" do
    new_operation = Operation.new(odate: Time.now,
                                  description: "Test description",
                                  category_id: 2)
    assert_not(new_operation.valid?)
  end

  test "return false if param 'amount' is not a number in operation" do
    new_operation = Operation.new(amount: "not a number",
                                  odate: Time.now,
                                  description: "Test description",
                                  category_id: 2)
    assert_not(new_operation.valid?)
  end
end
