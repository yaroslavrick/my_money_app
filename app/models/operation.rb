# frozen_string_literal: true

class Operation < ApplicationRecord
  AMOUNT_FIELD_MIN_NUM = 0
  PAGINATION_PAGES = 5

  belongs_to :category

  validates :amount, presence: true, numericality: { greater_than: AMOUNT_FIELD_MIN_NUM }
  paginates_per PAGINATION_PAGES

  def self.find_operation_by_category(id)
    where(category_id: id) if id.present?
  end

  def self.find_operations_by_date(date_from, date_to)
    where('odate >= :date_from AND odate <= :date_to', { date_from: date_from.to_date, date_to: date_to.to_date })
  end
end
