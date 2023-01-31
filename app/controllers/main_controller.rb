class MainController < ApplicationController
  def index
    @operations = Operation.all
    @activities = Activity.all
    @categories = Category.all
  end
end
