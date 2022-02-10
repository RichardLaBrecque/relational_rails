# User Story 20, Child Delete (x2)
#
# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child

require 'rails_helper'
RSpec.describe 'Delete Houses', type: :feature do
describe 'Delete a house' do
    describe 'I can visit the houses show page and delete the house by clicking the delete button' do

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

    it 'can delete an existing house' do
      visit "/houses/#{@ann.id}"


      click_link "Delete #{@ann.family_name}"

      expect(current_path).to eq("/houses")
      expect(page).to_not have_content(@ann.family_name)
    end
  end
end
end
