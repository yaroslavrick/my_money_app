# frozen_string_literal: true

module SortService
  class Sort
    SORTING_OPTIONS = {
      'date' => ->(name_amount) { name_amount[0] },
      'category_name' => ->(name_amount) { name_amount[0].downcase },
      'total_amounts' => ->(name_amount) { name_amount[1] }
    }.freeze
    def initialize(params:, data:)
      @params = params
      @data = data
    end

    def call
      sort
    end

    private

    def sort
      return @data if @params.blank?

      sorting_lambda = SORTING_OPTIONS[@params]
      return @data unless sorting_lambda

      @data.sort_by(&sorting_lambda)
    end
  end
end
