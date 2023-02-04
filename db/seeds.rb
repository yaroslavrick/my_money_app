# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'ffaker'
# Generating Categories:
# categ1 = Category.create(name: "phones", description: "cell and mobile phones")
# categ2 = Category.create(name: "laptops", description: "small computers")
10.times do
  Category.create(name: FFaker::Product.product_name, description: FFaker::Lorem.sentence(1))
end
# Generating Operations:
100.times do
  Operation.create(amount: rand(5.0..2000.0),
                   odate: (Time.zone.today - rand(90)),
                   description: FFaker::Product.product,
                   category_id: rand(1..Category.all.count))
end
