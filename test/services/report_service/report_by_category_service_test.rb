# frozen_string_literal: true

require 'test_helper'

class ReportByCategoryServiceTest < ActiveSupport::TestCase
  fixtures :categories, :operations

  def setup
    @category = categories(:one)
    @operation = operations(:one)
  end

  test 'returns the operations that belong to the specific category' do
    result = ReportService::ReportByCategoryService.new(params: { 'operation' =>
                                                                    { 'category_id' => @category.id } }).call
    assert_equal [@operation], result[:operations]
  end

  test 'returns amounts' do
    result = ReportService::ReportByCategoryService.new(params: { 'operation' =>
                                                                    { 'category_id' => @category.id } }).call
    assert_equal [@operation.amount], result[:amounts]
  end

  test 'returns dates' do
    expected_dates = [operations(:one).odate.strftime('%Y-%m-%d')]
    service = ReportService::ReportByCategoryService.new(params: {
                                                           'operation' => {
                                                             'category_id' => categories(:one).id
                                                           }
                                                         })
    assert_equal expected_dates, service.call[:dates]
  end

  test 'returns category_name' do
    result = ReportService::ReportByCategoryService.new(params: { 'operation' =>
                                                                    { 'category_id' => @category.id } }).call
    assert_equal @category.name, result[:category_name]
  end
end
