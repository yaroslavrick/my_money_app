class ReportsController < ApplicationController
  def index
  end

  def create_report_by_dates
  end

  def create_report_by_category
  end

  def report_by_category
    @operations = Operation.where("category_id = ?", params["operation"]["category_id"]) unless params["operation"]["category_id"].empty?
    # or:
    # @operations = Operation.where("category_id = :category", { category: params["operation"]["category_id"]})

    @category = Category.find(params["operation"]["category_id"]).name
    group_operations
    create_report
  end

  def report_by_dates
    @operations = Operation.where("odate >= :date_from AND odate <= :date_to",
                                  { date_from: params["filter"]["date-from"].to_date,
                                    date_to: params["filter"]["date-to"].to_date }
    )
    group_operations
    create_report
  end

  private
  def group_operations
    @operations_grouped = @operations.group("strftime('%Y-%m-%d', odate)").sum("amount")
  end
  def create_report
    # operations_data = @operations.map { |o| [o.amount, o.odate] }
    # @amounts = operations_data.map { |e| e[0]}
    # @dates = operations_data.map { |e| e[1]}
    @dates = @operations_grouped.map { |e| e[0]}
    @amounts = @operations_grouped.map { |e| e[1]}
  end
end
