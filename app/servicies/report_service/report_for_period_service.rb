# frozen_string_literal: true

module ReportService
  class ReportForPeriodService < CreateReportService
    def call
      find_by_date
      group_by_category
      categories_and_total_amount
      data_for_chart_by_dates
      find_total_sum
      generate_result
    end

    private

    def find_by_date
      @operations = Operation.find_operations_by_date(@params['filter']['date-from'], @params['filter']['date-to'])
    end

    def group_by_category
      @categories_and_total_amount = @operations.group('category_id', 'odate').sum('amount')
    end

    def filter_by_category
      category_id = @params['filter']['category'].to_i
      @categories_and_total_amount = @categories_and_total_amount.where(category_id:)
    end

    def data_for_chart_by_dates
      find_categories_names
      find_total_amounts
    end

    def find_categories_names
      @categories_names = @categories_and_total_amount.pluck(0)
    end

    def find_total_amounts
      @total_amounts = @categories_and_total_amount.pluck(1)
    end

    def find_total_sum
      @total_sum = @total_amounts.sum.round(2)
    end

    def categories_and_total_amount
      raise NotImplementedError
    end

    def generate_result
      {
        total_sum: @total_sum,
        categories_and_total_amount: @categories_and_total_amount,
        categories_names: @categories_names,
        total_amounts: @total_amounts
      }
    end
  end
end
