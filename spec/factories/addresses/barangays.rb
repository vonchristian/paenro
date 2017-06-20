FactoryGirl.define do
  factory :barangay, class: "Addresses::Barangay" do
    name { Faker::Company.name }
    municipality
  end
end
