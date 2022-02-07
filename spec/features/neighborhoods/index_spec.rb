# User Story 1, Parent Index (x2)
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

# User Story 6, Parent Index sorted by Most Recently Created (x2)
#
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
#
# User Story 9, Parent Index Link
#
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index

require 'rails_helper'
RSpec.describe 'Neighboorhood #index', type: :feature do

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

  it 'displays names of all neighborhoods' do
    visit '/neighborhoods'

   expect(page).to have_content(@hood_1.name)
   expect(page).to have_content(@hood_1.created_at)
   expect(page).to have_content(@hood_2.name)
   expect(page).to have_content(@hood_2.created_at)
   expect(page).to have_content(@hood_3.name)
   expect(page).to have_content(@hood_3.created_at)
   expect(page).to have_content(@hood_4.name)
   expect(page).to have_content(@hood_4.created_at)
   expect(page).to have_content(@hood_5.name)
   expect(page).to have_content(@hood_5.created_at)
  end

  it 'displays names of all neighborhoods' do
    visit '/neighborhoods'

   expect(@hood_5.name).to appear_before(@hood_4.name)
   expect(@hood_4.name).to appear_before(@hood_3.name)
   expect(@hood_3.name).to appear_before(@hood_2.name)
   expect(@hood_2.name).to appear_before(@hood_1.name)
  end

  it 'has a navigation bar on the top of the houses page that links to the neighborhoods#index' do
    visit '/houses'
    click_on 'Neighborhood Index'
    expect(current_path).to eq('/neighborhoods')
  end

  it 'has a navigation bar on the top of the neighborhoods/:id page that links to the neighborhoods#index' do
    visit "/neighborhoods/#{@hood_1.id}/houses"
    click_on 'Neighborhood Index'
    expect(current_path).to eq('/neighborhoods')
  end

  it 'has a navigation bar on the top of the houses/:id page that links to the neighborhoods#index' do
    visit "/houses/#{@lemon.id}"
    click_on 'Neighborhood Index'
    expect(current_path).to eq('/neighborhoods')
  end
end
