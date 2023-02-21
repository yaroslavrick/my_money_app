# frozen_string_literal: true

class ReportsController < ApplicationController
  def create_report_by_dates; end

  def create_report_by_category; end

  def report_by_category
    find_by_category
    paginate_by_category
    find_category_name
    group_by_date_and_summarize
    data_for_chart_by_category
  end

  def report_by_dates
    find_by_date
    group_by_id
    paginate_by_date
    categories_and_total_amount
    data_for_chart_by_dates
    find_total_sum
    sort_table_data
  end

  private

  def find_by_category
    @operations = Operation.find_operation_by_category(params['operation']['category_id'])
    # @operations = find_operation_by_category(params['operation']['category_id'])
  end

  def paginate_by_category
    @operations_paginated = @operations.page params[:page]
  end

  def paginate_by_date
    @operations_paginated = @categories_and_total_amount.page params[:page]
  end

  def find_category_name
    @category = Category.find_category_name_by_params(params['operation']['category_id'])
  end

  def group_by_date_and_summarize
    @operations_grouped = @operations.group("strftime('%Y-%m-%d', odate)").sum('amount')
  end

  def data_for_chart_by_category
    @dates = @operations_grouped.pluck(0)
    @amounts = @operations_grouped.pluck(1)
  end

  def find_by_date
    @operations = Operation.find_operations_by_date(params['filter']['date-from'], params['filter']['date-to'])
    # @operations = find_operations_by_date(params['filter']['date-from'], params['filter']['date-to'])
  end

  def group_by_id
    @categories_and_total_amount = @operations.group('category_id')
  end

  def categories_and_total_amount
    @categories_and_total_amount = @categories_and_total_amount.sum('amount').transform_keys do |key|
      Category.find(key).name
    end
  end

  def data_for_chart_by_dates
    @categories_names = @categories_and_total_amount.pluck(0)
    @total_amounts = @categories_and_total_amount.pluck(1)
  end

  def find_total_sum
    @total_sum = @total_amounts.sum.round(2)
  end

  def sort_table_data
    case params[:sort]
    when 'category_name'
      @categories_and_total_amount = @categories_and_total_amount.sort_by { |_name, category| category }.to_h
    when 'total_amounts'
      @categories_and_total_amount = @categories_and_total_amount.sort_by { |name, _category| name }.to_h
    end
  end
end
