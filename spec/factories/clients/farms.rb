FactoryGirl.define do
  factory :farm, class: "Clients::Farm" do
    client
    area "9.99"
    suitable false
    cleared false
  end
end
