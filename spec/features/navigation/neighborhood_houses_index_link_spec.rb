# User Story 10, Parent Child Index Link
#
# As a visitor
# When I visit a parent show page ('/parents/:id')
# Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')

# User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)
#
# As a visitor
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order
# When I click on the link
# I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order

require 'rails_helper'
RSpec.describe 'Neighboorhood houses #index', type: :feature do

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

  it 'will link to the /neighborhoods/#{neighborhood.id/houses page from /neighborhoods/#{neighborhood.id' do
    visit "/neighborhoods/#{@hood_1.id}"
    click_on "Indexed Houses"
    expect(current_path).to eq("/neighborhoods/#{@hood_1.id}/houses")
  end

  it 'will link to the /neighborhoods/#{neighborhood.id/houses page from /neighborhoods/#{neighborhood.id' do
    visit "/neighborhoods/#{@hood_2.id}"
    click_on "Indexed Houses"
    expect(current_path).to eq("/neighborhoods/#{@hood_2.id}/houses")
  end

  it 'will link to the /neighborhoods/#{neighborhood.id/houses page from /neighborhoods/#{neighborhood.id' do
    visit "/neighborhoods/#{@hood_3.id}"
    click_on "Indexed Houses"
    expect(current_path).to eq("/neighborhoods/#{@hood_3.id}/houses")
  end

  it 'will link to the /neighborhoods/#{neighborhood.id/houses page from /neighborhoods/#{neighborhood.id' do
    visit "/neighborhoods/#{@hood_4.id}"
    click_on "Indexed Houses"
    expect(current_path).to eq("/neighborhoods/#{@hood_4.id}/houses")
  end

  it 'will link to the /neighborhoods/#{neighborhood.id/houses page from /neighborhoods/#{neighborhood.id' do
    visit "/neighborhoods/#{@hood_5.id}"
    click_on "Indexed Houses"
    expect(current_path).to eq("/neighborhoods/#{@hood_5.id}/houses")
  end
end

require 'rails_helper'
RSpec.describe 'Update Neighborhood', type: :feature do
  describe 'Sort Neighborhood Houses Index alphabetically' do
    describe 'I can visit the Neighborhood Houses Index and  click on a link to sort them' do

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

      it 'can sort Houses Index alphabetically' do
        visit "/neighborhoods/#{@hood_1.id}/houses"

        expect(@dowis.family_name).to appear_before(@ammon.family_name)
        expect(@ammon.family_name).to appear_before(@fleur.family_name)

        click_link 'Sort houses in alphabetical order'


        expect(current_path).to eq("/neighborhoods/#{@hood_1.id}/houses")

        expect(@ammon.family_name).to appear_before(@dowis.family_name)
        expect(@dowis.family_name).to appear_before(@fleur.family_name)

      end
    end
  end
end
