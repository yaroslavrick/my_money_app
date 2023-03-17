# frozen_string_literal: true

class AddNotNullConstraintToAmountInOperations < ActiveRecord::Migration[7.0]
  def change
    change_column_null :operations, :amount, false
  end
end
