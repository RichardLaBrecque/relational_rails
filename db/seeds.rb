# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#lets make some hoods
hood_1 = Neighborhood.create!(name: 'Happy', has_pool: true, number_of_streets: 17)
hood_2 = Neighborhood.create!(name: 'Sad', has_pool: false, number_of_streets: 13)
hood_3 = Neighborhood.create!(name: 'Medium', has_pool: true, number_of_streets: 11)
hood_4 = Neighborhood.create!(name: 'Excited', has_pool: true, number_of_streets: 67)
hood_5 = Neighborhood.create!(name: 'Meh', has_pool: false, number_of_streets: 3)

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
