FactoryGirl.define do
  factory :address do
    addressable_id 1
    addressable_type "MyString"
    barangay nil
    municipality nil
    sitio nil
  end
end
