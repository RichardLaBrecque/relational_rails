require 'rails_helper'

RSpec.describe Contractor, type: :model do
  it 'exists' do
    contractor = Contractor.new
    expect(contractor).to be_a(Contractor)
  end

  # describe "validations" do
  #   it {should validate_presence_of :name}
  #   it {should validate_presence_of :licensed}
  #   it {should validate_presence_of :service_cost}
  #   it {should validate_presence_of :service_area}
  # end
end
