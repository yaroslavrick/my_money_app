# frozen_string_literal: true

class AddNotNullConstraintToDescriptionInCategories < ActiveRecord::Migration[7.0]
  def change
    change_column_null :categories, :description, false
  end
end
