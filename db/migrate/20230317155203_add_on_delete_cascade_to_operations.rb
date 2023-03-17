# frozen_string_literal: true

class AddOnDeleteCascadeToOperations < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :operations, :categories
    add_foreign_key :operations, :categories, on_delete: :cascade
  end
end
