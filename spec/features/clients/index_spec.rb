require 'rails_helper'
# [ ] done
#
# User Story 3, Child Index (x2)
#
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:
Rspec.describe 'Client index page' do
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
    @client_1 = Client.create!(name: 'Dani', recent_visit: true, required_visits_per_year: 2, contractor_id: @contractor_1)
    @client_2 = Client.create!(name: 'Lisa', recent_visit: true, required_visits_per_year: 1, contractor_id: @contractor_2)
    @client_3 = Client.create!(name: 'Sam', recent_visit: true, required_visits_per_year: 3, contractor_id: @contractor_3)
    @client_4 = Client.create!(name: 'Joe', recent_visit: true, required_visits_per_year: 4, contractor_id: @contractor_4)
    @client_5 = Client.create!(name: 'Ian', recent_visit: true, required_visits_per_year: 5, contractor_id: @contractor_1)
    @client_6 = Client.create!(name: 'Greg', recent_visit: true, required_visits_per_year: 3, contractor_id: @contractor_2)
    @client_7 = Client.create!(name: 'Jesse', recent_visit: true, required_visits_per_year: 4, contractor_id: @contractor_2)
    @client_8 = Client.create!(name: 'Katy', recent_visit: true, required_visits_per_year: 3, contractor_id: @contractor_3)
  end
  it 'can show names of all clients' do
    visit '/clients'
    expect(page).to have_content(@client_1)
    expect(page).to have_content(@client_2)
    expect(page).to have_content(@client_3)
    expect(page).to have_content(@client_4)
    expect(page).to have_content(@client_5)
    expect(page).to have_content(@client_6)
    expect(page).to have_content(@client_7)
    expect(page).to have_content(@client_8)
  end
end
