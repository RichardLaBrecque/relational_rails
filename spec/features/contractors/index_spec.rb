require 'rails_helper'

#user story
#[ ] done
#User Story 1, Parent(contractor) Index (x2)
#For each parent(contractor) table
#As a visitor
#When I visit '/parents'(/contractors)
#Then I see the name of each parent(contractor) record in the system

RSpec.describe 'contractors index page' do
  it 'can show names of all contractors' do
    contractor_1 = Contractor.create(name: "Rich",
                                     licensed: true,
                                     service_cost: 40,
                                     service_area: 1)
    contractor_2 = Contractor.create(name: "Austin",
                                    licensed: true,
                                    service_cost: 25,
                                    service_area: 2)
    contractor_3 = Contractor.create(name: "Tamara",
                                    licensed: true,
                                    service_cost: 40,
                                    service_area: 3)
    contractor_4 = Contractor.create(name: "Mike",
                                    licensed: true,
                                    service_cost: 55,
                                    service_area: 4)
   visit '/contractors'
  expect(page).to have_content(contractor_1.name)
  expect(page).to have_content(contractor_2.name)
  expect(page).to have_content(contractor_3.name)
  expect(page).to have_content(contractor_4.name)

  end
end
