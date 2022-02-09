# User Story 14, Child Update (x2)
#
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
require 'rails_helper'
RSpec.describe 'Update Houses', type: :feature do
describe 'Update a house' do
    describe 'I can visit the house update form by clicking a link on the house#show' do

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

    it 'can update an existing house' do
      visit "/houses/#{@tenzin}"


      click_link "Update #{@tenzin.family_name}"

      expect(current_path).to eq("/houses/#{@tenzin.family_name}/edit")

      fill_in :family_name, with: 'Tenzin Dowis'

      click_on 'Sumbit updates for House'

      expect(current_path).to eq("/houses/#{@tenzin}")

      expect(page).to have_content('Tenzin Dowis')
    end
  end
end
end
