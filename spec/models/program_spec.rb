require 'rails_helper'

RSpec.describe Program, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :beneficiaries }
    it { is_expected.to have_many :program_locations }
    it { is_expected.to have_many :barangays }
    it { is_expected.to have_many :farms }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
  it ".target_area" do
    program = create(:program)
    program_location = create(:program_location, program: program, target_area: 10)
    program_location_2 = create(:program_location, program: program, target_area: 10)

    expect(Program.target_area).to eql(20)
  end

  it "#target_area" do
    program = create(:program)
    program_location = create(:program_location, program: program, target_area: 10)
    program_location_2 = create(:program_location, program: program, target_area: 10)

    expect(program.target_area).to eql(20)
  end
  it "#actual_area" do
    program = create(:program)
    client = create(:client, program: program)
    farm = create(:farm, area: 10, client: client)
    farm_2 = create(:farm, area: 10, client: client)

    expect(program.actual_area).to eql(20)
  end
  it "#target_beneficiaries" do
    program = create(:program)
    program_location = create(:program_location, program: program, beneficiary_count: 10)
    program_location_2 = create(:program_location, program: program, beneficiary_count: 10)

    expect(program.target_beneficiaries).to eql(20)
  end

  it "#available_slots" do
    program = create(:program)
    client = create(:client, program: program)
    program_location = create(:program_location, program: program,  beneficiary_count: 10)

    expect(program.available_slots).to eql(9)
  end
end
