class Activity < ApplicationRecord
  has_many :operations

  validates :atype, uniqueness: true, presence: true
end
