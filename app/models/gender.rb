class Gender < ApplicationRecord
  validates :sex, presence: true, uniqueness: true

  # one gender can has many watches
  has_many :watches, dependent: :destroy
end
