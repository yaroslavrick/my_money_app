class Category < ApplicationRecord
  has_many :operations
  validates :name, presence: true
  # Назва категорії має бути унікальною (не може бути двох категорій з
  #    однаковими назвами)
  validates :name, uniqueness: true
  # Опис категорії є обов’язковою властивістю (не nil)
  validates :description, presence: true
end
