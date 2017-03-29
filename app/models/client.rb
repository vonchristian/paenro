class Client < ApplicationRecord
  enum sex: [:male, :female]
  validates :first_name, :middle_name, :last_name, :contact_number, presence: true

end
