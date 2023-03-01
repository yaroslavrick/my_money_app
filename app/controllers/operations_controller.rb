# frozen_string_literal: true

class OperationsController < ApplicationController
  before_action :set_operation, only: %i[show edit update destroy]

  def index
    @operations = Operation.page params[:page]
  end

  def show; end

  def new
    @operation = Operation.new
  end

  def edit; end

  def create
    @operation = Operation.new(operation_params)

    if @operation.save
      redirect_to operation_url(@operation), notice: I18n.t('operation_was_successfully_created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @operation.update(operation_params)
      redirect_to operation_url(@operation), notice: I18n.t('operation_was_successfully_updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @operation.destroy

    redirect_to operations_url, notice: I18n.t('operation_was_successfully_destroyed')
  end

  private

  def set_operation
    @operation = Operation.find(params[:id])
  end

  def operation_params
    params.require(:operation).permit(:amount, :odate, :description, :category_id)
  end
end
