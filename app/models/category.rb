# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :operations, dependent: :delete_all

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true

  def self.find_category_name_by_params(id)
    find(id).name if id.present?
  end
end
