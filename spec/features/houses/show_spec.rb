#   User Story 4, Child Show (x2)
#
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

require 'rails_helper'
RSpec.describe 'Homes #show', type: :feature do

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

  it "displays the dowis attributes" do
    visit "/houses/#{@dowis.id}"

    expect(page).to have_content(@dowis.family_name)
    expect(page).to have_content(@dowis.id)
    expect(page).to have_content(@dowis.hos_member)
    expect(page).to have_content(@dowis.parking_spaces)
    expect(page).to have_content(@dowis.neighborhood.name)
    expect(page).to have_content(@dowis.neighborhood_id)
    expect(page).to have_content(@dowis.created_at)
    expect(page).to have_content(@dowis.updated_at)
    expect(page).not_to have_content(@tenzin.family_name)
    expect(page).not_to have_content(@lemon.family_name)
  end

  it "displays the tenzin attributes" do
    visit "/houses/#{@tenzin.id}"

    expect(page).to have_content(@tenzin.family_name)
    expect(page).to have_content(@tenzin.id)
    expect(page).to have_content(@tenzin.hos_member)
    expect(page).to have_content(@tenzin.parking_spaces)
    expect(page).to have_content(@tenzin.neighborhood.name)
    expect(page).to have_content(@tenzin.neighborhood_id)
    expect(page).to have_content(@tenzin.created_at)
    expect(page).to have_content(@tenzin.updated_at)
    expect(page).not_to have_content(@tamara.family_name)
    expect(page).not_to have_content(@lemon.family_name)
  end

  it "displays the lemon attributes" do
    visit "/houses/#{@lemon.id}"

    expect(page).to have_content(@lemon.family_name)
    expect(page).to have_content(@lemon.id)
    expect(page).to have_content(@lemon.hos_member)
    expect(page).to have_content(@lemon.parking_spaces)
    expect(page).to have_content(@lemon.neighborhood.name)
    expect(page).to have_content(@lemon.neighborhood_id)
    expect(page).to have_content(@lemon.created_at)
    expect(page).to have_content(@lemon.updated_at)
    expect(page).not_to have_content(@tenzin.family_name)
    expect(page).not_to have_content(@tamara.family_name)
  end

end
