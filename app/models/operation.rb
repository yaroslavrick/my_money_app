class Operation < ApplicationRecord
  belongs_to :category
  default_scope { order(odate: :asc)}

  validates :amount, presence: true, numericality: true
  paginates_per 5

  def self.find_operation_by_category(id)
    self.where("category_id = ?", id) unless id.empty?
  end

  def self.find_operations_by_date(date_from, date_to)
    self.where("odate >= :date_from AND odate <= :date_to", { date_from: date_from.to_date, date_to: date_to.to_date })
  end
end
