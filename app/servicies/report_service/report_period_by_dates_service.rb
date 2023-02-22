# frozen_string_literal: true

module ReportService
  class ReportPeriodByDatesService < ReportForPeriodService
    private

    def categories_and_total_amount
      @categories_and_total_amount = @categories_and_total_amount.transform_keys do |key|
        date = key[1].strftime('%Y-%m-%d')
        "#{date} "
      end
    end
  end
end
