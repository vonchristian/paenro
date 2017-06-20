FactoryGirl.define do
  factory :cropping, class: "Farms::Cropping" do
    product
    farm
  end
end
