# frozen_string_literal: true

module ReportService
  class ReportByCategoryService < CreateReportService
    def call
      find_by_category
      find_category_name
      group_by_date_and_summarize
      data_for_chart_by_category
      generate_result
    end

    private

    def find_by_category
      @operations = Operation.find_operation_by_category(@params['operation']['category_id'])
    end

    def find_category_name
      @category_name = Category.find_category_name_by_params(@params['operation']['category_id'])
    end

    def group_by_date_and_summarize
      @operations_grouped = @operations.group('odate').sum('amount')
    end

    def data_for_chart_by_category
      group_dates_for_chart
      group_amounts_for_chart
    end

    def group_dates_for_chart
      @dates = @operations_grouped.pluck(0).map { |date| date.strftime('%Y-%m-%d') }
    end

    def group_amounts_for_chart
      @amounts = @operations_grouped.pluck(1)
    end

    def generate_result
      {
        amounts: @amounts,
        dates: @dates,
        operations: @operations,
        category_name: @category_name
      }
    end
  end
end
