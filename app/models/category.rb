# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :operations, dependent: :delete_all
  validates :name, presence: true
  # Назва категорії має бути унікальною (не може бути двох категорій з
  #    однаковими назвами)
  validates :name, uniqueness: true
  # Опис категорії є обов’язковою властивістю (не nil)
  validates :description, presence: true

  def self.find_category_name_by_params(id)
    find(id).name if id.present?
  end
end
