# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

debit = Activity.create(atype: "debit")
credit = Activity.create(atype: "credit")

# categ1 = Category.create(name: "phones", description: "cell and mobile phones")
# categ2 = Category.create(name: "laptops", description: "small computers")
