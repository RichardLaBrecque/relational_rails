require 'rails_helper'

RSpec.describe 'contractors index page' do
  it 'can show names of all contractors' do
    contractor_1 = Contractor.create(name: "rich",
                                     licensed: true,
                                     service_cost: 40,
                                     service_area: 1)
    contractor_2 = Contractor.create(name: "austin",
                                    licensed: true,
                                    service_cost: 25,
                                    service_area: 2)
                                    binding.pry
  visit '/contractors'
  expect(page).to have_content(contractor_1.name)
  expect(page).to have_content(contractor_2.name)
  end
end
