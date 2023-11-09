# class Brand
class Brand < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :watches, dependent: :destroy
end
