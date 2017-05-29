class Requirement < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
