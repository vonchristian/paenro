class Crop < ApplicationRecord
  has_many :croppings, class_name: "Farms::Cropping"
  has_many :farms, through: :croppings
  validates :name, presence: true, uniqueness: true
end
