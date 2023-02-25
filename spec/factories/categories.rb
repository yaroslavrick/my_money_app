# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { FFaker::Product.product_name }
    description { FFaker::Lorem.sentence(1) }
  end

  trait :smartphones do
    name { 'smartphones' }
    description { 'telephones with OS' }
  end

  trait :laptops do
    name { 'laptopts' }
    description { 'notebooks' }
  end
end
