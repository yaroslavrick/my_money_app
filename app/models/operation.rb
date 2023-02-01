class Operation < ApplicationRecord
  belongs_to :category

  validates :amount, presence: true, numericality: true
end
