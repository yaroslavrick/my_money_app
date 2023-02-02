class Operation < ApplicationRecord
  belongs_to :category
  default_scope { order(odate: :asc)}

  validates :amount, presence: true, numericality: true
  paginates_per 5
end
