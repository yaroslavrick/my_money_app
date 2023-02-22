# frozen_string_literal: true

class ReportsController < ApplicationController
  def create_report_by_dates; end

  def create_report_by_category; end

  def report_by_category
    @report = ReportService::ReportByCategoryService.new(params:).call
    create_report_data_by_category
  end

  def report_period_by_categories
    @report = ReportService::ReportPeriodByCategoriesService.new(params:).call
    create_report_data_for_period
  end

  def report_period_by_dates
    @report = ReportService::ReportPeriodByDatesService.new(params:).call
    create_report_data_for_period
  end

  private

  def create_report_data_for_period
    find_categories_names
    find_total_amounts
    find_total_sum
    find_categories_and_amount
  end

  def create_report_data_by_category
    find_dates
    find_amounts
    find_operations
    find_category_name
    create_pagination_data
  end

  def find_categories_names
    @categories_names = @report[:categories_names]
  end

  def find_total_amounts
    @total_amounts = @report[:total_amounts]
  end

  def find_total_sum
    @total_sum = @report[:total_sum]
  end

  def find_categories_and_amount
    @categories_and_total_amount = Kaminari.paginate_array(@report[:categories_and_total_amount].to_a)
      .page(params[:page]).per(5)
  end

  def find_dates
    @dates = @report[:dates]
  end

  def find_amounts
    @amounts = @report[:amounts]
  end

  def find_operations
    @operations = @report[:operations]
  end

  def find_category_name
    @category_name = @report[:category_name]
  end

  def create_pagination_data
    @operations_paginated = @operations.page params[:page]
  end
end
