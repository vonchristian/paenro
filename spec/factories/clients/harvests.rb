FactoryGirl.define do
  factory :harvest, class: "Clients::Harvest" do
    farm nil
    weight "9.99"
    gross_income "9.99"
  end
end
