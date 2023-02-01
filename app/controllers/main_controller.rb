class MainController < ApplicationController
  def index
    # @operations = Operation.all
    # @categories = Category.all
    @operations = Operation.page params[:page]
    @categories = Category.page params[:page]
  end
end
