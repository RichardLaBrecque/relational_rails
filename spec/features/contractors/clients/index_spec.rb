require 'rails_helper'
# [ ] done
#
# User Story 5, Parent Children Index (x2)
#
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:

RSpec.describe 'Contractors client index' do
  before (:each) do
    @contractor_1 = Contractor.create!(name: "Rich",
                                     licensed: true,
                                     service_cost: 40,
                                     service_area: 1)
    @contractor_2 = Contractor.create!(name: "Austin",
                                    licensed: true,
                                    service_cost: 25,
                                    service_area: 2)
    @contractor_3 = Contractor.create!(name: "Tamara",
                                    licensed: true,
                                    service_cost: 40,
                                    service_area: 3)
    @contractor_4 = Contractor.create!(name: "Mike",
                                    licensed: true,
                                    service_cost: 55,
                                    service_area: 4)
    @client_1 = @contractor_1.clients.create!(name: 'Zack', recent_visit: true, required_visits_per_year: 2)
    @client_2 = @contractor_2.clients.create!(name: 'Lisa', recent_visit: true, required_visits_per_year: 1)
    @client_3 = @contractor_3.clients.create!(name: 'Sam', recent_visit: true, required_visits_per_year: 3)
    @client_4 = @contractor_4.clients.create!(name: 'Joe', recent_visit: true, required_visits_per_year: 4)
    @client_5 = @contractor_1.clients.create!(name: 'Anna', recent_visit: true, required_visits_per_year: 5)
    @client_6 = @contractor_2.clients.create!(name: 'Greg', recent_visit: true, required_visits_per_year: 3)
    @client_7 = @contractor_3.clients.create!(name: 'Jesse', recent_visit: true, required_visits_per_year: 4)
    @client_8 = @contractor_4.clients.create!(name: 'Katy', recent_visit: true, required_visits_per_year: 3)
  end
  it 'lists clients for a specific contractor' do
    #binding.pry
    visit "/contractors/#{@contractor_1.id}/clients"
    #save_and_open_page
    expect(page).to have_content(@client_1.name)
    expect(page).to have_content(@client_1.recent_visit)
    expect(page).to have_content(@client_1.required_visits_per_year)
    expect(page).to have_content(@client_1.contractor_id)
    expect(page).to have_content(@client_1.updated_at)
    expect(page).to have_content(@client_1.created_at)
    expect(page).to have_content(@client_5.name)
    expect(page).to have_content(@client_5.recent_visit)
    expect(page).to have_content(@client_5.required_visits_per_year)
    expect(page).to have_content(@client_5.contractor_id)
    expect(page).to have_content(@client_5.updated_at)
    expect(page).to have_content(@client_5.created_at)
  end

#   User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)
#
# As a visitor
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order
# When I click on the link
# I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order

  it 'can sort alphabetically' do
    visit "/contractors/#{@contractor_1.id}/clients"
    click_on "Alphabetical Order"
    expect(current_path).to eq("/contractors/#{@contractor_1.id}/clients")
  end

  it 'displays alphabetical sort' do
    visit "/contractors/#{@contractor_1.id}/clients"
    click_on "Alphabetical Order"
    save_and_open_page
    expect(@client_5.name).to appear_before(@client_.name)
  end
end
