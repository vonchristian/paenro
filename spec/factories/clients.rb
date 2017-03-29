FactoryGirl.define do
  factory :client do
    first_name   { Faker::Name.first_name }
    middle_name  { Faker::Name.last_name }
    last_name    { Faker::Name.last_name }
    contact_number {Faker::Number.number(12)}
    sex 1
  end
end
