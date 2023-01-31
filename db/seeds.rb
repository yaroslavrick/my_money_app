# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'ffaker'

# Generating activities:
debit = Activity.create(atype: "debit")
credit = Activity.create(atype: "credit")

# Generating Categories:
categ1 = Category.create(name: "phones", description: "cell and mobile phones")
categ2 = Category.create(name: "laptops", description: "small computers")

# Generating Operations:
100.times do
  Operation.create(amount: rand(5.0..2000.0),
                   odate: (Date.today - rand(90)),
                   description: FFaker::Lorem.word,
                   activity_id: rand(1..Activity.all.count),
                   category_id: rand(1..Category.all.count)
                   )
end

# t.decimal "amount"
# t.datetime "odate"
# t.string "description"
# t.integer "activity_id"
# t.integer "category_id"