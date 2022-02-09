require 'rails_helper'
# [ ] done
#
# User Story 3, Child Index (x2)
#
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:
RSpec.describe 'Client index page' do
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
    @client_1 = @contractor_1.clients.create!(name: 'Dani', recent_visit: true, required_visits_per_year: 2)
    @client_2 = @contractor_2.clients.create!(name: 'Lisa', recent_visit: true, required_visits_per_year: 1)
    @client_3 = @contractor_3.clients.create!(name: 'Sam', recent_visit: true, required_visits_per_year: 3)
    @client_4 = @contractor_4.clients.create!(name: 'Joe', recent_visit: true, required_visits_per_year: 4)
    @client_5 = @contractor_1.clients.create!(name: 'Ian', recent_visit: true, required_visits_per_year: 5)
    @client_6 = @contractor_2.clients.create!(name: 'Greg', recent_visit: true, required_visits_per_year: 3)
    @client_7 = @contractor_3.clients.create!(name: 'Jesse', recent_visit: true, required_visits_per_year: 4)
    @client_8 = @contractor_4.clients.create!(name: 'Katy', recent_visit: true, required_visits_per_year: 3)
  end
  it 'can show names of all clients' do
    visit '/clients'
  
    expect(page).to have_content(@client_1.name)
    expect(page).to have_content(@client_1.recent_visit)
    expect(page).to have_content(@client_1.required_visits_per_year)
    expect(page).to have_content(@client_1.contractor_id)
    expect(page).to have_content(@client_1.updated_at)
    expect(page).to have_content(@client_1.created_at)
    expect(page).to have_content(@client_2.name)
    expect(page).to have_content(@client_2.recent_visit)
    expect(page).to have_content(@client_2.required_visits_per_year)
    expect(page).to have_content(@client_2.contractor_id)
    expect(page).to have_content(@client_2.updated_at)
    expect(page).to have_content(@client_2.created_at)
    expect(page).to have_content(@client_3.name)
    expect(page).to have_content(@client_3.recent_visit)
    expect(page).to have_content(@client_3.required_visits_per_year)
    expect(page).to have_content(@client_3.contractor_id)
    expect(page).to have_content(@client_3.updated_at)
    expect(page).to have_content(@client_3.created_at)
    expect(page).to have_content(@client_4.name)
    expect(page).to have_content(@client_4.recent_visit)
    expect(page).to have_content(@client_4.required_visits_per_year)
    expect(page).to have_content(@client_4.contractor_id)
    expect(page).to have_content(@client_4.updated_at)
    expect(page).to have_content(@client_4.created_at)
  end

  #where to locate this test
  it 'has a navigation bar on the top of the neighborhoods page that links to the houses#index' do
    visit '/contractors'
    click_on 'Client List'
    expect(current_path).to eq('/clients')
  end

  it 'has a navigation bar on the top of the neighborhoods/:id page that links to the houses#index' do
    visit "/contractors/#{@contractor_1.id}"
    click_on 'Client List'
    expect(current_path).to eq('/clients')
  end

  it 'has a navigation bar on the top of the houses/:id page that links to the houses#index' do
    visit "/clients/#{@client_1.id}"
    click_on 'Client List'
    expect(current_path).to eq('/clients')
  end
end
