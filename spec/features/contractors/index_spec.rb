require 'rails_helper'

#user story
#[ ] done
#User Story 1, Parent(contractor) Index (x2)
#For each parent(contractor) table
#As a visitor
#When I visit '/parents'(/contractors)
#Then I see the name of each parent(contractor) record in the system

RSpec.describe 'contractors index page' do
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

  it 'can show names of all contractors' do
   visit '/contractors'
   expect(page).to have_content(@contractor_1.name)
   expect(page).to have_content(@contractor_2.name)
   expect(page).to have_content(@contractor_3.name)
   expect(page).to have_content(@contractor_4.name)
  end

  it 'shows contractors ordered by created_at' do
    visit '/contractors'

  expect(@contractor_4.name).to appear_before(@contractor_3.name)
  expect(@contractor_3.name).to appear_before(@contractor_2.name)
  expect(@contractor_2.name).to appear_before(@contractor_1.name)
  expect(page).to have_content(@contractor_1.created_at)
  expect(page).to have_content(@contractor_2.created_at)
  expect(page).to have_content(@contractor_3.created_at)
  expect(page).to have_content(@contractor_4.created_at)


  end
  # User Story 17, Parent Update From Parent Index Page (x2)
  #
  # As a visitor
  # When I visit the parent index page
  # Next to every parent, I see a link to edit that parent's info
  # When I click the link
  # I should be taken to that parents edit page where I can update its information just like in User Story 4
  it 'has a link to the edit contractors page with each contractor' do
    visit '/contractors'
    click_on "Update #{@contractor_1.name}"
    expect(current_path).to eq("/contractors/#{@contractor_1.id}/edit")
  end

  # it 'has a navigation bar on the top of the neighborhoods page that links to the houses#index' do
  #   visit '/contractors'
  #   click_on 'Contractor List'
  #   expect(current_path).to eq('/contractors')
  # end
  #
  # it 'has a navigation bar on the top of the neighborhoods/:id page that links to the houses#index' do
  #   visit "/contractors/#{@contractor_1.id}"
  #   click_on 'Contractor List'
  #   expect(current_path).to eq('/contractors')
  # end
  #
  # it 'has a navigation bar on the top of the houses/:id page that links to the houses#index' do
  #   visit "/clients/#{@client_1.id}"
  #   click_on 'Contractor List'
  #   expect(current_path).to eq('/contractors')
  # end


end
