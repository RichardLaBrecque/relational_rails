require 'rails_helper'
RSpec.describe 'Homes #index', type: :feature do
#   User Story 3, Child Index (x2)
#
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:
  before :each do
    @hood_1 = Neighborhood.create!(name: 'Happy', has_pool: true, number_of_streets: 17)
    @hood_2 = Neighborhood.create!(name: 'Sad', has_pool: false, number_of_streets: 13)
    @hood_3 = Neighborhood.create!(name: 'Medium', has_pool: true, number_of_streets: 11)
    @hood_4 = Neighborhood.create!(name: 'Excited', has_pool: true, number_of_streets: 67)
    @hood_5 = Neighborhood.create!(name: 'Meh', has_pool: false, number_of_streets: 3)

     @dowis = hood_1.House.create!(family_name: 'Dowis', hos_member: false, parking_spaces: 3)
     @ammon = hood_1.House.create!(family_name: 'Ammon', hos_member: true, parking_spaces: 1)
     @fleur = hood_1.House.create!(family_name: 'Fleur', hos_member: true, parking_spaces: 2)
     @sasha = hood_2.House.create!(family_name: 'Sasha', hos_member: false, parking_spaces: 2)
     @john = hood_2.House.create!(family_name: 'John', hos_member: true, parking_spaces: 3)
     @tamara = hood_3.House.create!(family_name: 'Tamara', hos_member: false, parking_spaces: 3)
     @ann = hood_4.House.create!(family_name: 'Ann', hos_member: true, parking_spaces: 1)
     @tenzin = hood_4.House.create!(family_name: 'Tenzin', hos_member: false, parking_spaces: 1)
     @sam = hood_5.House.create!(family_name: 'Sam', hos_member: false, parking_spaces: 3)
     @lemon = hood_5.House.create!(family_name: 'Lemon', hos_member: false, parking_spaces: 2)
  end
  visit '/houses'

  expect(page).to have_content(@dowis.family_name)
  expect(page).to have_content(@dowis.hos_member)
  expect(page).to have_content(@dowis.parking_spaces)

  expect(page).to have_content(@ammon.family_name)
  expect(page).to have_content(@ammon.hos_member)
  expect(page).to have_content(@ammon.parking_spaces)

  expect(page).to have_content(@fleur.family_name)
  expect(page).to have_content(@fleur.hos_member)
  expect(page).to have_content(@fleur.parking_spaces)

  expect(page).to have_content(@sasha.family_name)
  expect(page).to have_content(@sasha.hos_member)
  expect(page).to have_content(@sasha.parking_spaces)

  expect(page).to have_content(@john.family_name)
  expect(page).to have_content(@john.hos_member)
  expect(page).to have_content(@john.parking_spaces)

  expect(page).to have_content(@tamara.family_name)
  expect(page).to have_content(@tamara.hos_member)
  expect(page).to have_content(@tamara.parking_spaces)

  expect(page).to have_content(@ann.family_name)
  expect(page).to have_content(@ann.hos_member)
  expect(page).to have_content(@ann.parking_spaces)

  expect(page).to have_content(@tenzin.family_name)
  expect(page).to have_content(@tenzin.hos_member)
  expect(page).to have_content(@tenzin.parking_spaces)

  expect(page).to have_content(@sam.family_name)
  expect(page).to have_content(@sam.hos_member)
  expect(page).to have_content(@sam.parking_spaces)

  expect(page).to have_content(@lemon.family_name)
  expect(page).to have_content(@lemon.hos_member)
  expect(page).to have_content(@lemon.parking_spaces)
end
