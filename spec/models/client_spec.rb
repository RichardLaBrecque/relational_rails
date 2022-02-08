require 'spec_helper'

RSpec.describe Client, type: :model do
  it 'exists' do
    client = Client.new
    expect(client).to be_a(Client)
  end

  it {should belong_to :contractors}

  # describe "validations" do
  #   it {should validate_presense_of :name}
  #   it {should validate_presense_of :recent_visit}
  #   it {should validate_presense_of :required_visits_per_year}
  #   it {should validate_presense_of :contractor_id}
  # end
end
