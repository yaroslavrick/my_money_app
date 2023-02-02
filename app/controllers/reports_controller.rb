class ReportsController < ApplicationController
  def create_report_by_dates
  end

  def create_report_by_category
  end

  def report_by_category
    find_operation_by_category
    find_category_name_by_params
    group_operations
    create_report
  end

  def report_by_dates
    find_operations_by_date
    group_operations
    create_report
  end

  private
  def find_operation_by_category
    @operations = Operation.where("category_id = ?", params["operation"]["category_id"]) unless params["operation"]["category_id"].empty?
    # or:
    # @operations = Operation.where("category_id = :category", { category: params["operation"]["category_id"]})
  end

  def find_category_name_by_params
    @category = Category.find(params["operation"]["category_id"]).name
  end

  def find_operations_by_date
    @operations = Operation.where("odate >= :date_from AND odate <= :date_to",
                                  { date_from: params["filter"]["date-from"].to_date,
                                    date_to: params["filter"]["date-to"].to_date }
    )
  end

  def group_operations
    @operations_grouped = @operations.group("strftime('%Y-%m-%d', odate)").sum("amount")
  end

  def create_report
    @dates = @operations_grouped.map { |e| e[0]}
    @amounts = @operations_grouped.map { |e| e[1]}
  end
end
