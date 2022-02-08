
# User Story 5, Parent Children Index (x2)
#
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes


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

  it 'lists the family names and attributes for the houses in the neighborhood' do

    visit "/neighborhoods/#{@hood_1.id}/houses"

    expect(page).to have_content(@hood_1.name)
    expect(page).to have_content(@hood_1.id)

    expect(page).to have_content(@dowis.family_name)
    expect(page).to have_content(@dowis.id)
    expect(page).to have_content(@dowis.hos_member)
    expect(page).to have_content(@dowis.parking_spaces)
    expect(page).to have_content(@dowis.neighborhood.name)
    expect(page).to have_content(@dowis.neighborhood_id)
    expect(page).to have_content(@dowis.created_at)
    expect(page).to have_content(@dowis.updated_at)

    expect(page).to have_content(@ammon.family_name)
    expect(page).to have_content(@ammon.id)
    expect(page).to have_content(@ammon.hos_member)
    expect(page).to have_content(@ammon.parking_spaces)
    expect(page).to have_content(@ammon.neighborhood.name)
    expect(page).to have_content(@ammon.neighborhood_id)
    expect(page).to have_content(@ammon.created_at)
    expect(page).to have_content(@ammon.updated_at)

    expect(page).to have_content(@fleur.family_name)
    expect(page).to have_content(@fleur.id)
    expect(page).to have_content(@fleur.hos_member)
    expect(page).to have_content(@fleur.parking_spaces)
    expect(page).to have_content(@fleur.neighborhood.name)
    expect(page).to have_content(@fleur.neighborhood_id)
    expect(page).to have_content(@fleur.created_at)
    expect(page).to have_content(@fleur.updated_at)
  end

  it 'lists the family names and attributes for the houses in the neighborhood' do
    visit "/neighborhoods/#{@hood_2.id}/houses"

    expect(page).to have_content(@hood_2.name)
    expect(page).to have_content(@hood_2.id)

    expect(page).to have_content(@john.family_name)
    expect(page).to have_content(@john.id)
    expect(page).to have_content(@john.hos_member)
    expect(page).to have_content(@john.parking_spaces)
    expect(page).to have_content(@john.neighborhood.name)
    expect(page).to have_content(@john.neighborhood_id)
    expect(page).to have_content(@john.created_at)
    expect(page).to have_content(@john.updated_at)

    expect(page).to have_content(@sasha.family_name)
    expect(page).to have_content(@sasha.id)
    expect(page).to have_content(@sasha.hos_member)
    expect(page).to have_content(@sasha.parking_spaces)
    expect(page).to have_content(@sasha.neighborhood.name)
    expect(page).to have_content(@sasha.neighborhood_id)
    expect(page).to have_content(@sasha.created_at)
    expect(page).to have_content(@sasha.updated_at)
  end

  it 'lists the family names and attributes for the houses in the neighborhood' do
    visit "/neighborhoods/#{@hood_3.id}/houses"

    expect(page).to have_content(@hood_3.name)
    expect(page).to have_content(@hood_3.id)

    expect(page).to have_content(@tamara.family_name)
    expect(page).to have_content(@tamara.id)
    expect(page).to have_content(@tamara.hos_member)
    expect(page).to have_content(@tamara.parking_spaces)
    expect(page).to have_content(@tamara.neighborhood.name)
    expect(page).to have_content(@tamara.neighborhood_id)
    expect(page).to have_content(@tamara.created_at)
    expect(page).to have_content(@tamara.updated_at)
  end

  it 'lists the family names and attributes for the houses in the neighborhood' do
    visit "/neighborhoods/#{@hood_4.id}/houses"

    expect(page).to have_content(@hood_4.name)
    expect(page).to have_content(@hood_4.id)

    expect(page).to have_content(@ann.family_name)
    expect(page).to have_content(@ann.id)
    expect(page).to have_content(@ann.hos_member)
    expect(page).to have_content(@ann.parking_spaces)
    expect(page).to have_content(@ann.neighborhood.name)
    expect(page).to have_content(@ann.neighborhood_id)
    expect(page).to have_content(@ann.created_at)
    expect(page).to have_content(@ann.updated_at)

    expect(page).to have_content(@tenzin.family_name)
    expect(page).to have_content(@tenzin.id)
    expect(page).to have_content(@tenzin.hos_member)
    expect(page).to have_content(@tenzin.parking_spaces)
    expect(page).to have_content(@tenzin.neighborhood.name)
    expect(page).to have_content(@tenzin.neighborhood_id)
    expect(page).to have_content(@tenzin.created_at)
    expect(page).to have_content(@tenzin.updated_at)
  end

  it 'lists the family names and attributes for the houses in the neighborhood' do
    visit "/neighborhoods/#{@hood_5.id}/houses"

    expect(page).to have_content(@hood_5.name)
    expect(page).to have_content(@hood_5.id)

    expect(page).to have_content(@sam.family_name)
    expect(page).to have_content(@sam.id)
    expect(page).to have_content(@sam.hos_member)
    expect(page).to have_content(@sam.parking_spaces)
    expect(page).to have_content(@sam.neighborhood.name)
    expect(page).to have_content(@sam.neighborhood_id)
    expect(page).to have_content(@sam.created_at)
    expect(page).to have_content(@sam.updated_at)

    expect(page).to have_content(@lemon.family_name)
    expect(page).to have_content(@lemon.id)
    expect(page).to have_content(@lemon.hos_member)
    expect(page).to have_content(@lemon.parking_spaces)
    expect(page).to have_content(@lemon.neighborhood.name)
    expect(page).to have_content(@lemon.neighborhood_id)
    expect(page).to have_content(@lemon.created_at)
    expect(page).to have_content(@lemon.updated_at)
  end

end
