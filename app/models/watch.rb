class Watch < ApplicationRecord
  validates :name, :price, presence: true
  validates :price, numericality: { only_float: true, greater_than_or_equal_to: 0 }

  # a watch can only belongs to one gender
  belongs_to :gender
  belongs_to :brand
end
