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
    @categories_and_total_amount = Kaminari.paginate_array(report[:categories_and_total_amount].to_a)
      .page(params[:page]).per(10)
  end

  # def report_by_dates_grouped
  #   report = ReportService::ReportByDateService.new(params:).call
  #   @categories_names = report[:categories_names]
  #   @total_amounts = report[:total_amounts]
  #   @total_sum = report[:total_sum]
  #   @dates_and_total_amount = report[:dates_and_total_amount]
  #   @operations_paginated = Kaminari.paginate_array(@dates_and_total_amount.to_a)
  #     .page(@params[:page])
  #     .per(5)
  # end
end
