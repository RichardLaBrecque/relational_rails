require 'rails_helper'
# User Story 19, Parent Delete (x2)

# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent

describe 'contractor delete' do
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
  it 'has a link to delete contractors from the show page' do
    visit "/contractors/#{@contractor_1.id}"
    click_on "Delete #{@contractor_1.name}"
    expect(current_path).to eq('/contractors')
    save_and_open_page
    expect(page).to_not have_content(@contractor_1.name)
  end
end
