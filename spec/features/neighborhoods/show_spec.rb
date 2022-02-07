# User Story 2, Parent Show (x2)
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

# User Story 7, Parent Child Count (x2)
#
# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent

require 'rails_helper'
RSpec.describe 'Neighboorhood #show', type: :feature do

  before :each do
    @hood_1 = Neighborhood.create!(name: 'Happy', has_pool: true, number_of_streets: 17)
    @hood_2 = Neighborhood.create!(name: 'Sad', has_pool: false, number_of_streets: 13)
    @hood_3 = Neighborhood.create!(name: 'Medium', has_pool: true, number_of_streets: 11)
    @hood_4 = Neighborhood.create!(name: 'Excited', has_pool: true, number_of_streets: 67)
    @hood_5 = Neighborhood.create!(name: 'Meh', has_pool: false, number_of_streets: 3)

     @dowis = @hood_1.houses.create!(family_name: 'Dowis', hos_member: false, parking_spaces: 3)
     @ammon = @hood_1.houses.create!(family_name: 'Ammon', hos_member: true, parking_spaces: 1)
     @fleur = @hood_1.houses.create!(family_name: 'Fleur', hos_member: true, parking_spaces: 2)
     @sasha = @hood_2.houses.create!(family_name: 'Sasha', hos_member: false, parking_spaces: 2)
     @john = @hood_2.houses.create!(family_name: 'John', hos_member: true, parking_spaces: 3)
     @tamara = @hood_3.houses.create!(family_name: 'Tamara', hos_member: false, parking_spaces: 3)
     @ann = @hood_4.houses.create!(family_name: 'Ann', hos_member: true, parking_spaces: 1)
     @tenzin = @hood_4.houses.create!(family_name: 'Tenzin', hos_member: false, parking_spaces: 1)
     @sam = @hood_5.houses.create!(family_name: 'Sam', hos_member: false, parking_spaces: 3)
     @lemon = @hood_5.houses.create!(family_name: 'Lemon', hos_member: false, parking_spaces: 2)
  end

  it "displays the neighborhood's attributes" do
    visit "/neighborhoods/#{@hood_1.id}"
save_and_open_page
   expect(page).to have_content(@hood_1.name)
   expect(page).to have_content(@hood_1.houses.count)
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
   expect(page).to have_content(@hood_2.houses.count)
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
   expect(page).to have_content(@hood_3.houses.count)
   expect(page).to have_content(@hood_3.has_pool)
   expect(page).to have_content(@hood_3.number_of_streets)
   expect(page).to have_content(@hood_3.created_at)
   expect(page).to have_content(@hood_3.updated_at)
   expect(page).not_to have_content(@hood_1.name)
   expect(page).not_to have_content(@hood_2.name)
  end

end
