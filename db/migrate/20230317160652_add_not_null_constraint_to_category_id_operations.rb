# frozen_string_literal: true

class AddNotNullConstraintToCategoryIdOperations < ActiveRecord::Migration[7.0]
  def change
    change_column_null :operations, :category_id, false
  end
end
