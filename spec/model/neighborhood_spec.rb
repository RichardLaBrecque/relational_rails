require 'rails_helper'
RSpec.describe Neighborhood type: :model do
  it 'exists' do
    hood_1 = Neighborhood.create!(name: 'Happy', has_pool: true, number_of_streets: 17)
   expect(hood_1).to be_a(Neighborhood)
  end

end
# create_table :neighborhoods do |t|
#   t.string :name
#   t.boolean :has_pool
#   t.integer :number_of_streets
#   t.datetime :created_at
#   t.datetime :updated_at
