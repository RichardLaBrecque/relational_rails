require 'rails_helper'
describe 'navbar links' do
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
    @client_1 = @contractor_1.clients.create!(name: 'Zack', recent_visit: true, required_visits_per_year: 2)
    @client_2 = @contractor_2.clients.create!(name: 'Lisa', recent_visit: true, required_visits_per_year: 1)
    @client_3 = @contractor_3.clients.create!(name: 'Sam', recent_visit: true, required_visits_per_year: 3)
    @client_4 = @contractor_4.clients.create!(name: 'Joe', recent_visit: true, required_visits_per_year: 4)
    @client_5 = @contractor_1.clients.create!(name: 'Anna', recent_visit: true, required_visits_per_year: 5)
    @client_6 = @contractor_2.clients.create!(name: 'Greg', recent_visit: true, required_visits_per_year: 3)
    @client_7 = @contractor_3.clients.create!(name: 'Jesse', recent_visit: true, required_visits_per_year: 4)
    @client_8 = @contractor_4.clients.create!(name: 'Katy', recent_visit: true, required_visits_per_year: 3)
  end
  it 'has a navigation bar on the top of the contractors page that links to the clients index' do
    visit '/contractors'
    click_on 'Client List'
    expect(current_path).to eq('/clients')
  end

  it 'has a navigation bar on the top of the contractors/:id page that links to the clients index' do
    visit "/contractors/#{@contractor_1.id}"
    click_on 'Client List'
    expect(current_path).to eq('/clients')
  end

  it 'has a navigation bar on the top of the clients/:id page that links to the clients index' do
    visit "/clients/#{@client_1.id}"
    click_on 'Client List'
    expect(current_path).to eq('/clients')
  end

  it 'has a navigation bar on the top of the contractors page that links to the contractors index' do
    visit '/contractors'
    click_on 'Contractor List'
    expect(current_path).to eq('/contractors')
  end

  it 'has a navigation bar on the top of the contractors/:id page that links to the contractors index' do
    visit "/contractors/#{@contractor_1.id}"
    click_on 'Contractor List'
    expect(current_path).to eq('/contractors')
  end

  it 'has a navigation bar on the top of the clients/:id page that links to the clients index' do
    visit "/clients/#{@client_1.id}"
    click_on 'Contractor List'
    expect(current_path).to eq('/contractors')
  end

end
