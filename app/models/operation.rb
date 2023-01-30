class Operation < ApplicationRecord
  belongs_to :category
  belongs_to :activity

  #   Сума операції – обов’язкова властивість, а також значення – число, яке
  #    більше за 0
  validates :amount, presence: true, numericality: { greater_than: 0 }
  #   Дата операції – обов’язкова властивість
  validates :odate, presence: true
  #   Короткий опис – обов’язкова властивість
  validates :description, presence: true
end
