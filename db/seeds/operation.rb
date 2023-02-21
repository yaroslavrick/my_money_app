# frozen_string_literal: true

100.times do
  Operation.create(amount: rand(5.0..2000.0),
                   odate: (Time.zone.today - rand(90)),
                   description: FFaker::Product.product,
                   category_id: rand(1..Category.all.count))
end
