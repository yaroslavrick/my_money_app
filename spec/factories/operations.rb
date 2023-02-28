# frozen_string_literal: true

require 'ffaker'

FactoryBot.define do
  factory :operation do
    amount { rand(5.0..2000.0) }
    odate { (Time.zone.today - rand(90)) }
    description { FFaker::Product.product }
    category
  end

  trait :iphone do
    amount { 2500 }
    odate { 'Thu, 24 Jan 2023 00 : 00 : 00.000000000 UTC + 00 : 00' }
    description { 'iPhone' }
  end

  trait :xiaomi do
    amount { 1500 }
    odate { 'Thu, 25 Jan 2022 00 : 00 : 00.000000000 UTC + 00 : 00' }
    description { 'Xiaomi' }
  end

  trait :nexus do
    amount { 2300 }
    odate { 'Thu, 26 Jan 2023 00 : 00 : 00.000000000 UTC + 00 : 00' }
    description { 'Nexus' }
  end

  trait :mac_book do
    amount { 4300 }
    odate { 'Thu, 27 Jan 2023 00 : 00 : 00.000000000 UTC + 00 : 00' }
    description { 'MacBook' }
  end
  trait :sony_vaio do
    amount { 2300 }
    odate { 'Thu, 29 Jan 2023 00 : 00 : 00.000000000 UTC + 00 : 00' }
    description { 'Sony Vaio' }
  end
  trait :lenovo do
    amount { 1000 }
    odate { 'Thu, 29 Jan 2023 00 : 00 : 00.000000000 UTC + 00 : 00' }
    description { 'Lenovo' }
  end
end
