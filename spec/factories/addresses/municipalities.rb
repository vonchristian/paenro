FactoryGirl.define do
  factory :municipality, class: "Addresses::Municipality" do
    name { Faker::Company.name }
  end
end
