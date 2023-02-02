class ReportsController < ApplicationController
  def index
  end

  def create_report_by_dates
  end

  def create_report_by_category
  end

  def report_by_category
    @operations = Operation.where("category_id = ?", params["operation"]["category_id"]) unless params["operation"]["category_id"].empty?
    # @operations = Operation.where("category_id = :category", { category: params["operation"]["category_id"]})

    @category = Category.find(params["operation"]["category_id"]).name
    create_report
  end

  def report_by_dates
    @operations = Operation.where("odate >= :date_from AND odate <= :date_to",
                                  { date_from: params["filter"]["date-from"].to_date,
                                    date_to: params["filter"]["date-to"].to_date }
    )
    @operations_grouped = @operations.group("strftime('%Y-%m-%d', odate)").sum("amount")
     # .group("strftime('%Y-%m-%d 00:00:00 UTC', created_at, '-6 days', 'weekday 0')")
    create_report
  end

  private
  def create_report
    # operations_data = @operations.map { |o| [o.amount, o.odate] }
    # @amounts = operations_data.map { |e| e[0]}
    # @dates = operations_data.map { |e| e[1]}
    @amounts = @operations_grouped.map { |e| e[1]}
    @dates = @operations_grouped.map { |e| e[0]}
  end
end
