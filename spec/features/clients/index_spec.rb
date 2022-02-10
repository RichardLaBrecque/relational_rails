require 'rails_helper'
# [ ] done
#
# User Story 3, Child Index (x2)
#
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:
#   User Story 15, Child Index only shows `true` Records (x2)
#
# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`
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
    @client_1 = @contractor_1.clients.create!(name: 'Dani', recent_visit: true, required_visits_per_year: 1)
    @client_2 = @contractor_2.clients.create!(name: 'Lisa', recent_visit: false, required_visits_per_year: 2)
    @client_3 = @contractor_3.clients.create!(name: 'Sam', recent_visit: true, required_visits_per_year: 3)
    @client_4 = @contractor_4.clients.create!(name: 'Joe', recent_visit: false, required_visits_per_year: 4)
    @client_5 = @contractor_1.clients.create!(name: 'Ian', recent_visit: true, required_visits_per_year: 5)
    @client_6 = @contractor_2.clients.create!(name: 'Greg', recent_visit: false, required_visits_per_year: 6)
    @client_7 = @contractor_3.clients.create!(name: 'Jesse', recent_visit: true, required_visits_per_year: 7)
    @client_8 = @contractor_4.clients.create!(name: 'Katy', recent_visit: false, required_visits_per_year: 8)
  end
  it 'can show names of all true clients' do
    visit '/clients'

    expect(page).to have_content(@client_1.name)
    expect(page).not_to have_content(@client_2.name)
    expect(page).to have_content(@client_3.name)
    expect(page).not_to have_content(@client_4.name)

  end

  # User Story 18, Child Update From Childs Index Page (x1)

  # As a visitor
  # When I visit the `child_table_name` index page or a parent `child_table_name` index page
  # Next to every child, I see a link to edit that child's info
  # When I click the link
  # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
  it 'has a link to update each client' do
    visit '/clients'
    click_on "Update #{@client_1.name}"
    expect(current_path).to eq("/clients/#{@client_1.id}/edit")
  end

#   User Story 21, Display Records Over a Given Threshold (x2)
#
# As a visitor
# When I visit the Parent's children Index Page
# I see a form that allows me to input a number value
# When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
# Then I am brought back to the current index page with only the records that meet that threshold shown.
  it 'limits clients by visits per year form' do
    visit "/contractors/#{@contractor_1.id}/clients"
    fill_in 'limit', with: 4
    click_on 'Limit return'
    expect(current_path).to eq("/contractors/#{@contractor_1.id}/clients")
    expect(page).to have_content(@client_5.name)
    expect(page).to_not have_content(@client_4.name)
  end

#   User Story 23, Child Delete From Childs Index Page (x1)
#
# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to delete that child
# When I click the link
# I should be taken to the `child_table_name` index page where I no longer see that child
  it 'has a delete link in the client index' do
    visit "/clients"
    click_on "Delete #{@client_1.name}"
    expect(current_path).to eq("/clients")
    expect(page).to_not have_content(@client_1.name)
  end

  #where to locate this test
  # it 'has a navigation bar on the top of the neighborhoods page that links to the houses#index' do
  #   visit '/contractors'
  #   click_on 'Client List'
  #   expect(current_path).to eq('/clients')
  # end
  #
  # it 'has a navigation bar on the top of the neighborhoods/:id page that links to the houses#index' do
  #   visit "/contractors/#{@contractor_1.id}"
  #   click_on 'Client List'
  #   expect(current_path).to eq('/clients')
  # end
  #
  # it 'has a navigation bar on the top of the houses/:id page that links to the houses#index' do
  #   visit "/clients/#{@client_1.id}"
  #   click_on 'Client List'
  #   expect(current_path).to eq('/clients')
  # end

end
