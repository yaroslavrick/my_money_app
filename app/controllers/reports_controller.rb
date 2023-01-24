class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    # @operations = Operation.all
    @operations = Operation.where("category_id = ?", params["operation"]["category_id"]) unless params["operation"]["category_id"].empty?
  end

  def report_by_dates
    @operations = Operation.where("odate >= :date_from AND odate <= :date_to",
                                  { date_from: params["filter"]["date-from"].to_date, date_to: params["filter"]["date-to"].to_date })
  end
end
