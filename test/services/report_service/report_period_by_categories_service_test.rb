# frozen_string_literal: true

require 'test_helper'

class ReportPeriodByCategoriesServiceTest < ActionDispatch::IntegrationTest
  test 'generates a report grouped by categories and date range' do
    category1 = categories(:one)
    category2 = categories(:two)

    params = {
      'filter' => {
        'date-from' => '2023-01-01',
        'date-to' => '2023-01-31'
      }
    }

    report_service = ReportService::ReportPeriodByCategoriesService.new(params:)
    result = report_service.call

    assert_equal 2, result[:categories_and_total_amount].count
    assert_equal 2, result[:categories_names].count
    assert_equal 2, result[:total_amounts].count
    assert_equal 29.97, result[:total_sum]

    category1_name = category1.name.to_s
    assert_equal 9.99, result[:categories_and_total_amount][category1_name]
    category2_name = category2.name.to_s
    assert_equal 19.98, result[:categories_and_total_amount][category2_name]
  end
end
