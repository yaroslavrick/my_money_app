# frozen_string_literal: true

require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  fixtures :categories

  test 'renders the report_by_category template when category is selected' do
    category = categories(:one)
    get '/reports/report_by_category', params: { operation: { category_id: category.id } }
    assert_response :success
    assert_template :report_by_category
  end

  test 'redirects to create_report_by_category when category is not selected' do
    get '/reports/report_by_category', params: { operation: { category_id: nil } }
    assert_response :redirect
    assert_redirected_to reports_create_report_by_category_path
  end
end
