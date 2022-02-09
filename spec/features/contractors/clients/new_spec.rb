require 'rails_helper'
#   User Story 13, Parent Child Creation (x2)
#
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
describe 'can add clients from the contractors client list' do
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
  it 'has a link to add new clients for a contractor' do
    visit "/contractors/#{@contractor_1.id}/clients"
    click_on "Create Client"
    expect(current_path).to eq("/contractors/#{@contractor_1.id}/clients/new")
  end

  it 'can create new clients with the form' do
    visit "/contractors/#{@contractor_1.id}/clients/new"
    #save_and_open_page
      fill_in 'name', with: "Matt"
      fill_in "recent_visit", with: "True"
      fill_in "required_visits_per_year", with: 3
      click_on 'Create Client'
      expect(current_path).to eq("/contractors/#{@contractor_1.id}/clients")
      save_and_open_page
      expect(page).to have_content("Matt")
  end
end
