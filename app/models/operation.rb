class Operation < ApplicationRecord
  belongs_to :category
  belongs_to :activity

  validates :amount, presence: true, numericality: true
end
