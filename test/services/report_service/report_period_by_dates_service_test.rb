# frozen_string_literal: true

require 'test_helper'

class ReportPeriodByDatesServiceTest < ActionDispatch::IntegrationTest
  setup do
    @category1 = categories(:one)
    @category2 = categories(:two)
    @operation1 = operations(:one)
    @operation2 = operations(:two)
    @operation4 = operations(:four)
    @params = {
      'filter' => {
        'date-from' => '2023-01-01',
        'date-to' => '2023-02-01'
      }
    }
  end

  test 'should return correct report data for given period by dates' do
    service = ReportService::ReportPeriodByDatesService.new(params: @params)
    result = service.call

    assert_equal 1, result[:categories_and_total_amount].keys.size
    assert_equal 9.99, result[:total_sum]
    assert_equal ['2023-01-30'], result[:categories_names]
    assert_equal [9.99], result[:total_amounts]
  end
end
