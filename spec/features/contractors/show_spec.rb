require 'rails_helper'

RSpec.describe 'Contractors show page' do
  it 'shows a single contractor' do
    contractor_1 = Contractor.create(name: "rich",
                                     licensed: true,
                                     service_cost: 40,
                                     service_area: 1)
    contractor_2 = Contractor.create(name: "austin",
                                    licensed: true,
                                    service_cost: 25,
                                    service_area: 2)

  visit "/contractors/#{contractor_1.id}"
  save_and_open_page
  expect(page).to have_content(contractor_1.name)
  expect(page).to have_content(contractor_1.licensed)
  expect(page).to have_content(contractor_1.service_cost)
  expect(page).to have_content(contractor_1.service_area)
  expect(page).to have_content(contractor_1.created_at)
  expect(page).to have_content(contractor_1.updated_at)
  expect(page).to_not have_content(contractor_2.name)
  end
end
