FactoryGirl.define do
  factory :program_location, class: "Programs::ProgramLocation" do
    barangay
    program 
  end
end
