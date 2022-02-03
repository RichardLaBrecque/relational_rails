require 'rails_helper'

RSpec.describe Contractor, type: :model do
  it 'exists' do
    contractor = Contractor.new
    expect(contractor).to be_a(Contractor)
  end
end
