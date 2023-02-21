# frozen_string_literal: true

require 'ffaker'

10.times do
  Category.create(name: FFaker::Product.product_name, description: FFaker::Lorem.sentence(1))
end
