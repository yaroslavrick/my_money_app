class Operation < ApplicationRecord
  belongs_to :category

  validates :amount, presence: true, numericality: true
  paginates_per 5
end
