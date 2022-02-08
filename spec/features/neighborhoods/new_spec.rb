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

require 'rails_helper'
RSpec.describe 'New Neighborhood', type: :feature do
describe 'As a visitor' do
    describe 'When I visit the new neighborhood form by clicking a link on the index' do
      it 'I can create a new neighborhood' do
        visit '/neighborhoods'

        click_link 'New Neighborhood'

        expect(current_path).to eq('/neighborhood/new')

        fill_in 'name', with: 'Sunrise'
        fill_in 'has_pool', with: true
        fill_in 'number_of_streets', with:23

        click_on 'Create Neighborhood'

        expect(current_path).to eq("/neighborhoods")
        expect(page).to have_content('Megan')
      end
    end
  end
end
