# frozen_string_literal: true

class Operation < ApplicationRecord
  belongs_to :category
  default_scope { order(odate: :asc) }

  validates :amount, presence: true, numericality: true
  paginates_per 5

  def self.find_operation_by_category(id)
    where(category_id: id) if id.present?
  end

  def self.find_operations_by_date(date_from, date_to)
    where('odate >= :date_from AND odate <= :date_to', { date_from: date_from.to_date, date_to: date_to.to_date })
  end

  # scope :find_operation_by_category, ->(category_id) { where(category_id:) }
  # scope :find_operations_by_date, lambda { |date_from, date_to|
  #   where(
  #     'odate >= :date_from AND odate <= :date_to',
  #     { date_from: date_from.to_date, date_to: date_to.to_date }
  #   )
  # }
end
