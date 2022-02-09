#   User Story 3, Child Index (x2)
#
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

# User Story 15, Child Index only shows `true` Records (x2)
#
# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true

require 'rails_helper'
RSpec.describe 'Houses #index', type: :feature do

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

  it "will list all homes and their attributes" do
    visit '/houses'

    expect(page).not_to have_content(@dowis.family_name)


    expect(page).to have_content(@ammon.family_name)
    expect(page).to have_content(@ammon.hos_member)
    expect(page).to have_content(@ammon.parking_spaces)
    expect(page).to have_content(@ammon.neighborhood_id)
    expect(page).to have_content(@ammon.created_at)
    expect(page).to have_content(@ammon.updated_at)

    expect(page).to have_content(@fleur.family_name)
    expect(page).to have_content(@fleur.hos_member)
    expect(page).to have_content(@fleur.parking_spaces)
    expect(page).to have_content(@fleur.neighborhood_id)
    expect(page).to have_content(@fleur.created_at)
    expect(page).to have_content(@fleur.updated_at)

    expect(page).not_to have_content(@sasha.family_name)


    expect(page).to have_content(@john.family_name)
    expect(page).to have_content(@john.hos_member)
    expect(page).to have_content(@john.parking_spaces)
    expect(page).to have_content(@john.neighborhood_id)
    expect(page).to have_content(@john.created_at)
    expect(page).to have_content(@john.updated_at)

    expect(page).not_to have_content(@tamara.family_name)


    expect(page).to have_content(@ann.family_name)
    expect(page).to have_content(@ann.hos_member)
    expect(page).to have_content(@ann.parking_spaces)
    expect(page).to have_content(@ann.neighborhood_id)
    expect(page).to have_content(@ann.created_at)
    expect(page).to have_content(@ann.updated_at)

    expect(page).not_to have_content(@tenzin.family_name)

    expect(page).not_to have_content(@sam.family_name)


    expect(page).not_to have_content(@lemon.family_name)

  end
end

RSpec.describe 'Update Neighborhood', type: :feature do
describe 'Update a neighborhood' do
    describe 'I can visit the neighborhood update form by clicking a link on the neighborhood#index' do

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

    it 'can update an existing neighborhood' do

      visit '/houses'
      click_link "Update #{@fleur.family_name} Information"

      expect(current_path).to eq("/houses/#{@fleur.id}/edit")
    end

    it 'can update an existing neighborhood' do

      visit "/neighborhoods/#{@hood_2.id}/houses"
      click_link "Update #{@sasha.family_name} Information"

      expect(current_path).to eq("/houses/#{@sasha.id}/edit")

    end
  end
end
end
