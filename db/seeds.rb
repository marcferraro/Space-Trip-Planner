require 'faker'

Trip.destroy_all
Location.destroy_all
TripLocation.destroy_all
TravellerTrip.destroy_all
Traveller.destroy_all


# traveller1 = Traveller.create(name: "Marc")
# traveller2 = Traveller.create(name: "Rachelle")


# trip1 = Trip.create(name: "My trip", start_date: Date.parse("2001-04-22"))
# trip2 = Trip.create(name: "Return Trip")

# location1 = Location.create(name: "Mars")
# location2 = Location.create(name: "Jupiter")


# traveller_trip1 = TravellerTrip.create(traveller_id: traveller1.id, trip_id: trip1.id)
# traveller_trip2 = TravellerTrip.create(traveller_id: traveller2.id, trip_id: trip2.id)

# trip_location1 = TripLocation.create(trip_id: trip1.id, location_id: location1.id)
# trip_location2 = TripLocation.create(trip_id: trip2.id, location_id: location2.id)

#binding.pry


#Time.new.to_s.slice(0,10)


30.times do
    Traveller.create(name: Faker::Name.name, age: Faker::Number.within(range: 20..104))  
end

50.times do

    category = ["Gas Giant", "Rocky Planet", "Star", "Asteroid", "Moon", "Water Planet", "Galaxy", "Nebula"]
    name = [Faker::Space.planet, Faker::Space.moon, Faker::Space.galaxy, Faker::Space.nebula]
    bool = [true, false]
#binding.pry
    Location.create(name: name.sample, temp: Faker::Number.within(range: 1..10), category: category.sample, rings: bool.sample, fauna: bool.sample, flora: bool.sample, daytime: bool.sample, landable: bool.sample, visited: bool.sample, gravity_level: Faker::Number.decimal(l_digits: 2))
end

