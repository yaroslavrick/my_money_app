# frozen_string_literal: true

require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test 'should get report_by_category_url' do
    get reports_report_by_category_url
    assert_response :success
  end

  test 'should get report_by_categories' do
    get reports_report_period_by_categories_url
    assert_response :success
  end

  test 'should get report_by_dates' do
    get reports_report_period_by_dates_url
    assert_response :success
  end

  test 'should get reports_create_report_by_category_path' do
    get reports_create_report_by_category_path
    assert_response :success
  end

  test 'should get reports_create_report_by_dates_path' do
    get reports_create_report_by_dates_path
    assert_response :success
  end
end
