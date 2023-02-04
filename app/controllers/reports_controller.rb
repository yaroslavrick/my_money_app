class ReportsController < ApplicationController
  def create_report_by_dates
  end

  def create_report_by_category
  end

  def report_by_category
    @operations = Operation.find_operation_by_category(params["operation"]["category_id"])
    paginate
    @category = Category.find_category_name_by_params(params["operation"]["category_id"])
    @operations_grouped = group_operations
    create_report
  end

  def report_by_dates
    @operations = Operation.find_operations_by_date(params["filter"]["date-from"], params["filter"]["date-to"])
    paginate
    @operations_grouped = group_operations
    create_report
  end

  private
  def paginate
    @operations_paginated = @operations.page params[:page]
  end

  def group_operations
    @operations_grouped = @operations.group("strftime('%Y-%m-%d', odate)").sum("amount")
  end

  def create_report
    @dates = @operations_grouped.map { |e| e[0]}
    @amounts = @operations_grouped.map { |e| e[1]}
  end
end
