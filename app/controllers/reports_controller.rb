class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    # @operations = Operation.where("category_id = ?", params["operation"]["category_id"]) unless params["operation"]["category_id"].empty?
    @operations = Operation.where("category_id = :category", { category: params["operation"]["category_id"]})

    operations_data = @operations.map { |o| [o.amount, o.category_id] }
    @dates = operations_data.map { |e| e[1]}
    @categories = operations_data.map { |e| e[0]}
  end

  def report_by_dates
    @operations = Operation.where("odate >= :date_from AND odate <= :date_to",
                                  { date_from: params["filter"]["date-from"].to_date,
                                    date_to: params["filter"]["date-to"].to_date
                                  }
    )

    operations_data = @operations.map { |o| [o.amount, o.odate.to_s] }
    @dates = operations_data.map { |e| e[1]}
    @amounts = operations_data.map { |e| e[0]}
  end
end
