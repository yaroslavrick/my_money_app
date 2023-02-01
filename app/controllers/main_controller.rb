class MainController < ApplicationController
  def index
    @operations = Operation.all
    @categories = Category.all
  end
end
