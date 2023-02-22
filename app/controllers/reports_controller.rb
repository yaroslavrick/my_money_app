# frozen_string_literal: true

class ReportsController < ApplicationController
  def create_report_by_dates; end

  def create_report_by_category; end

  def report_by_category
    report = ReportService::ReportByCategoryService.new(params:).call
    @dates = report[:dates]
    @amounts = report[:amounts]
    @operations = report[:operations]
    @category_name = report[:category_name]
    @operations_paginated = @operations.page params[:page]
  end

  def report_by_dates
    report = ReportService::ReportByDateService.new(params:).call
    @categories_names = report[:categories_names]
    @total_amounts = report[:total_amounts]
    @total_sum = report[:total_sum]
    @categories_and_total_amount = report[:categories_and_total_amount]
    # @operations_paginated = categories_and_total_amount.page(params[:page]).per(10)
  end
end
