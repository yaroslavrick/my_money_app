# frozen_string_literal: true

module ReportService
  class ReportPeriodByCategoriesService < ReportForPeriodService
    private

    def categories_and_total_amount
      @categories_and_total_amount = @categories_and_total_amount.transform_keys do |key|
        category = Category.find(key[0])
        category.name.to_s
      end
    end
  end
end
