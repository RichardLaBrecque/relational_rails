require 'rails_helper'
RSpec.describe House, type: :model do
  let(:hood_1) {Neighborhood.create!(name: 'Happy', has_pool: true, number_of_streets: 17)}

  it 'exists' do
    house_1 = hood_1.houses.create!(name: 'Hernandez', hos_member: false, parking_spaces: 2, neighborhood: hood_1)
   expect(house_1).to be_a(House)
  end

end
# t.string :name
# t.boolean :hos_member
# t.integer :parking_spaces
# t.references :neighborhood
# t.datetime :created_at
# t.datetime :updated_at
