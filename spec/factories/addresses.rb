FactoryGirl.define do
  factory :address do
    client
    municipality
    barangay
    sitio { Faker::Name.first_name }
  end
end
