# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @all_operations = Operation.all
    @all_categories = Category.all
    @operations = Operation.page params[:page]
    @categories = Category.page params[:page]

    respond_to do |format|
      format.html { render :index }
      format.json { render json: { operations: @operations, categories: @categories } }
    end
  end
end
