class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    # @operations = Operation.where("category_id = ?", params["operation"]["category_id"]) unless params["operation"]["category_id"].empty?
    @operations = Operation.where("category_id = :category AND activity_id = :activity", { category: params["operation"]["category_id"], activity: params["activity"]["activity_id"] })
  end

  def report_by_dates
    @operations = Operation.where("odate >= :date_from AND odate <= :date_to AND activity_id = :activity",
                                  { date_from: params["filter"]["date-from"].to_date, date_to: params["filter"]["date-to"].to_date, activity: params["activity"]["activity_id"]})
  end
end
