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

     @dowis = hood_1.House.create!(name: 'Dowis' hos_member: false parking_spaces: 3)
     @ammon = hood_1.House.create!(name: 'Ammon' hos_member: true parking_spaces: 1)
     @fleur = hood_1.House.create!(name: 'Fleur' hos_member: true parking_spaces: 2)
     @sasha = hood_2.House.create!(name: 'Sasha' hos_member: false parking_spaces: 2)
     @john = hood_2.House.create!(name: 'John' hos_member: true parking_spaces: 3)
     @tamara = hood_3.House.create!(name: 'Tamara' hos_member: false parking_spaces: 3)
     @ann = hood_4.House.create!(name: 'Ann' hos_member: true parking_spaces: 1)
     @tenzin = hood_4.House.create!(name: 'Tenzin' hos_member: false parking_spaces: 1)
     @sam = hood_5.House.create!(name: 'Sam' hos_member: false parking_spaces: 3)
     @lemon = hood_5.House.create!(name: 'Lemon' hos_member: false parking_spaces: 2)
  end
end
