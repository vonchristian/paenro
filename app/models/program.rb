class Program < ApplicationRecord
  has_many :beneficiaries, class_name: "Client"
  has_many :orders, through: :beneficiaries

  validates :name, presence: true, uniqueness: true
end
