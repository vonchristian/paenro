FactoryGirl.define do
  factory :program_grant, class: "Programs::ProgramGrant" do
    program
    product
    quantity 1
  end
end
