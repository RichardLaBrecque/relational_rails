require 'rails_helper'
# User Story 12, Parent Update (x2)
#
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
RSpec.describe 'update contractor' do
  before(:each) do
  @contractor_1 = Contractor.create!(name: "Rich",
    licensed: true,
    service_cost: 40,
    service_area: 1)
  end
  it 'creates has an edit contractor link' do
    visit "/contractors/#{@contractor_1.id}"
    click_on 'Update Contractor'
    expect(current_path).to eq("/contractors/#{@contractor_1.id}/edit")
  end

  it 'has a form for new contractors' do
    visit "/contractors/#{@contractor_1.id}/edit"
    fill_in 'Name', with: "Steve"
    fill_in "Licensed", with: "True"
    fill_in "service_cost", with: 35
    fill_in "service_area", with: 2
    click_on 'Update Contractor'
    expect(current_path).to eq('/contractors')
    expect(page).to have_content("Steve")
  end
end
