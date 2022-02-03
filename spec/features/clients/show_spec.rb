require 'rails_helper'
# User Story 4, Child Show (x2)
#
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

RSpec.describe 'Client show page' do
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

  it "has a client show page" do
    visit "/clients/#{@client_1.id}"
    save_and_open_page
    expect(page).to have_content(@client_1.name)
    expect(page).to have_content(@client_1.recent_visit)
    expect(page).to have_content(@client_1.required_visits_per_year)
    expect(page).to have_content(@client_1.contractor_id)
    expect(page).to have_content(@client_1.updated_at)
    expect(page).to have_content(@client_1.created_at)

  end
end
