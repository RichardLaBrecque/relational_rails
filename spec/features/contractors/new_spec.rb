require 'rails_helper'
# User Story 11, Parent Creation (x2)
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
RSpec.describe "Contractor Creation" do
  it 'creates has a new contractor link' do
    visit '/contractors'
    click_on 'New Contractor'
    expect(current_path).to eq('/contractors/new')
  end

  it 'has a form for new contractors' do
    visit '/contractors/new'
    fill_in 'Name', with: "Greg"
    fill_in "Licensed", with: "True"
    fill_in "service_cost", with: 35
    fill_in "service_area", with: 2
    click_on 'Create Contractor'
    expect(current_path).to eq('/contractors')
    expect(page).to have_content("Greg")
  end
end
