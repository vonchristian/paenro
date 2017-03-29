FactoryGirl.define do
  factory :sitio, class: "Addresses::Sitio" do
    name { Faker::Company.name }
    barangay nil
  end
end
