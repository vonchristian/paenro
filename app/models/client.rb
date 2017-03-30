class Client < ApplicationRecord
  include PgSearch
  pg_search_scope :text_search, :against => [:last_name, :first_name, :middle_name]
  enum sex: [:male, :female]

  has_many :addresses
  has_many :orders
  has_many :farms, class_name: "Clients::Farm"

  validates :first_name, :middle_name, :last_name, :contact_number, presence: true
  has_attached_file :avatar,
  styles: { large: "120x120>",
            medium: "70x70>",
            thumb: "40x40>",
            small: "30x30>",
            x_small: "20x20>"},
  default_url: ":style/profile_default.jpg",
  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  :url => "/system/:attachment/:id/:style/:filename"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  accepts_nested_attributes_for :addresses
  def full_name
    "#{first_name} #{middle_name.first.try(:capitalize)}. #{last_name}"
  end
  def current_address
    addresses.last.try(:details)
  end
end
