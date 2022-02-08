require 'rails_helper'
RSpec.describe Neighborhood, type: :model do

  it {should have_many :houses}

  it 'exists' do
    hood_1 = Neighborhood.create!(name: 'Happy', has_pool: true, number_of_streets: 17)
    expect(hood_1).to be_a(Neighborhood)
  end


end
