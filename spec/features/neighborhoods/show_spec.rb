require 'rails_helper'
RSpec.describe 'Neighboorhood #show', type: :feature do
# User Story 2, Parent Show (x2)
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

  before :each do
  @hood_1 = Neighborhood.create!(name: 'Happy', has_pool: true, number_of_streets: 17)
  @hood_2 = Neighborhood.create!(name: 'Sad', has_pool: false, number_of_streets: 13)
  @hood_3 = Neighborhood.create!(name: 'Medium', has_pool: true, number_of_streets: 11)
  end
  it "displays the neighborhood's attributes" do

    visit "/neighborhoods/#{@hood_1.id}"

   expect(page).to have_content(@hood_1.name)
   expect(page).to have_content(@hood_1.has_pool)
   expect(page).to have_content(@hood_1.number_of_streets)
   expect(page).to have_content(@hood_1.created_at)
   expect(page).to have_content(@hood_1.updated_at)
   expect(page).not_to have_content(@hood_2.name)
   expect(page).not_to have_content(@hood_3.name)
  end

  it "displays the neighborhood's attributes" do

    visit "/neighborhoods/#{@hood_2.id}"

   expect(page).to have_content(@hood_2.name)
   expect(page).to have_content(@hood_2.has_pool)
   expect(page).to have_content(@hood_2.number_of_streets)
   expect(page).to have_content(@hood_2.created_at)
   expect(page).to have_content(@hood_2.updated_at)
   expect(page).not_to have_content(@hood_1.name)
   expect(page).not_to have_content(@hood_3.name)
  end

  it "displays the neighborhood's attributes" do

    visit "/neighborhoods/#{@hood_3.id}"

   expect(page).to have_content(@hood_3.name)
   expect(page).to have_content(@hood_3.has_pool)
   expect(page).to have_content(@hood_3.number_of_streets)
   expect(page).to have_content(@hood_3.created_at)
   expect(page).to have_content(@hood_3.updated_at)
   expect(page).not_to have_content(@hood_1.name)
   expect(page).not_to have_content(@hood_2.name)
  end

end
