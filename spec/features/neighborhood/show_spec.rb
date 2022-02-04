require 'rails_helper'
RSpec.describe 'Neighboorhood #show', type: :feature do
# User Story 2, Parent Show (x2)
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table


  it "displays the neighborhood's attributes" do
    hood_1 = Neighborhood.create!(name: 'Happy', has_pool: true, number_of_streets: 17)
    visit "/neighborhoods/#{hood_1.id}"

   expect(page).to have_content(hood_1.name)
   expect(page).to have_content(hood_1.has_pool)
   expect(page).to have_content(hood_1.number_of_streets)
  end

  xit "displays the neighborhood's attributes" do
    @hood_2 = Neighborhood.create!(name: 'Sad', has_pool: false, number_of_streets: 13)
    visit "/neighborhoods/#{hood_2.id}"

   expect(page).to have_content(hood_2.name)
   expect(page).to have_content(hood_2.has_pool)
   expect(page).to have_content(hood_2.number_of_streets)
  end

  xit "displays the neighborhood's attributes" do
    @hood_3 = Neighborhood.create!(name: 'Medium', has_pool: true, number_of_streets: 11)
    visit "/neighborhoods/#{hood_3.id}"

   expect(page).to have_content(hood_3.name)
   expect(page).to have_content(hood_3.has_pool)
   expect(page).to have_content(hood_3.number_of_streets)
  end


end
