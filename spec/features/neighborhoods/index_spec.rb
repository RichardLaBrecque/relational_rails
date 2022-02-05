# User Story 1, Parent Index (x2)
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

require 'rails_helper'
RSpec.describe 'Neighboorhood #index', type: :feature do

  before :each do
   @hood_1 = Neighborhood.create!(name: 'Happy', has_pool: true, number_of_streets: 17)
   @hood_2 = Neighborhood.create!(name: 'Sad', has_pool: false, number_of_streets: 13)
   @hood_3 = Neighborhood.create!(name: 'Medium', has_pool: true, number_of_streets: 11)
   @hood_4 = Neighborhood.create!(name: 'Excited', has_pool: true, number_of_streets: 67)
   @hood_5 = Neighborhood.create!(name: 'Meh', has_pool: false, number_of_streets: 3)
  end

  it 'displays names of all neighborhoods' do
    visit '/neighborhoods'

   expect(page).to have_content(@hood_1.name)
   expect(page).to have_content(@hood_2.name)
   expect(page).to have_content(@hood_3.name)
   expect(page).to have_content(@hood_4.name)
   expect(page).to have_content(@hood_5.name)
  end
end
