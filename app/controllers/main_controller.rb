# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @all_operations = Operation.all
    @all_categories = Category.all
    @operations = Operation.page params[:page]
    @categories = Category.page params[:page]
  end
end
