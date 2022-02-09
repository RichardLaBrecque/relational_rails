# User Story 13, Parent Child Creation (x2)
#
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
require 'rails_helper'
RSpec.describe 'New House', type: :feature do
describe 'Add a new house' do
    describe 'I can visit the new house form by clicking a link on the neighborhood houses index' do

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
    it 'can create a new house' do
      visit "/neighborhoods/#{@hood_2.id}/houses"

      click_link 'Create New House Listing'

      expect(current_path).to eq("/neighborhoods/#{@hood_2.id}/houses/new")

      fill_in :family_name, with: 'Lollipop'
      select false, :from => 'hos_member'
      fill_in :parking_spaces, with: 1
      fill_in :neighborhood_id, with: @hood_2.id

      click_on 'Create New House'

      expect(current_path).to eq("/neighborhoods/#{@hood_2.id}/houses")
      expect(page).to have_content('Lollipop')
      end
    end
  end
end
