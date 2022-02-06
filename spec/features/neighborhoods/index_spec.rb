# User Story 1, Parent Index (x2)
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

# User Story 6, Parent Index sorted by Most Recently Created (x2)
#
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

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
   expect(page).to have_content(@hood_1.created_at)
   expect(page).to have_content(@hood_2.name)
   expect(page).to have_content(@hood_2.created_at)
   expect(page).to have_content(@hood_3.name)
   expect(page).to have_content(@hood_3.created_at)
   expect(page).to have_content(@hood_4.name)
   expect(page).to have_content(@hood_4.created_at)
   expect(page).to have_content(@hood_5.name)
   expect(page).to have_content(@hood_5.created_at)
  end

  it 'displays names of all neighborhoods' do
    visit '/neighborhoods'
save_and_open_page
   expect(@hood_5.name).to appear_before(@hood_4.name)
   expect(@hood_4.name).to appear_before(@hood_3.name)
   expect(@hood_3.name).to appear_before(@hood_2.name)
   expect(@hood_2.name).to appear_before(@hood_1.name)

  end
end
