FactoryGirl.define do
  factory :harvest, class: "Farms::Harvest" do
    farm
    weight "9.99"
    gross_income "9.99"
    cropping
  end
end
