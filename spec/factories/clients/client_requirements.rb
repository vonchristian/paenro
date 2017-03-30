FactoryGirl.define do
  factory :client_requirement, class: "Clients::ClientRequirement" do
    client nil
    requirement nil
  end
end
