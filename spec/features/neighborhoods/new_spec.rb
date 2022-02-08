# User Story 11, Parent Creation (x2)
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'
RSpec.describe 'New Neighborhood', type: :feature do
describe 'Add a neighborhood' do
    describe 'I can visit the new neighborhood form by clicking a link on the index' do

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
    it 'can create a new neighborhood' do
      visit '/neighborhoods'

      click_link 'New Neighborhood'

      expect(current_path).to eq('/neighborhoods/new')

      fill_in 'name', with: 'Sunrise'
      select true, :from => 'has_pool'
      fill_in 'Number of streets', with: 23

      click_on 'Create Neighborhood'

      expect(current_path).to eq('/neighborhoods')
      expect(page).to have_content('Sunrise')
      end
    end
  end
end
