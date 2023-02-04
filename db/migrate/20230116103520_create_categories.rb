# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :description

      t.timestamps
    end
    # add_index :operations, :description, unique: true
  end
end
