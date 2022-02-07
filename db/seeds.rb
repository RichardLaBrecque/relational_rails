# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#lets make some hoods
@hood_1 = Neighborhood.create!(name: 'Happy', has_pool: true, number_of_streets: 17)
@hood_2 = Neighborhood.create!(name: 'Sad', has_pool: false, number_of_streets: 13)
@hood_3 = Neighborhood.create!(name: 'Medium', has_pool: true, number_of_streets: 11)
@hood_4 = Neighborhood.create!(name: 'Excited', has_pool: true, number_of_streets: 67)
@hood_5 = Neighborhood.create!(name: 'Meh', has_pool: false, number_of_streets: 3)

#lets make some houses in the hoods
@dowis = @hood_1.houses.create!(family_name: 'Dowis', hos_member: false, parking_spaces: 3)
@ammon = @hood_1.houses.create!(family_name: 'Ammon', hos_member: true, parking_spaces: 1)
@fleur = @hood_1.houses.create!(family_name: 'Fleur', hos_member: true, parking_spaces: 2)
@sasha = @hood_2.houses.create!(family_name: 'Sasha', hos_member: false, parking_spaces: 2)
@john = @hood_2.houses.create!(family_name: 'John', hos_member: true, parking_spaces: 3)
@tamara = @hood_3.houses.create!(family_name: 'Tamara', hos_member: false, parking_spaces: 3)
@ann = @hood_4.houses.create!(family_name: 'Ann', hos_member: true, parking_spaces: 1)
@tenzin = @hood_4.houses.create!(family_name: 'Tenzin', hos_member: false, parking_spaces: 1)
@sam = @hood_5.houses.create!(family_name: 'Sam', hos_member: false, parking_spaces: 3)
@lemon = @hood_5.houses.create!(family_name: 'Lemon', hos_member: false, parking_spaces: 2)

#lets make some contractors
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
