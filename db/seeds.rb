require 'faker'

Trip.destroy_all
Location.destroy_all
TripLocation.destroy_all
TravellerTrip.destroy_all
Traveller.destroy_all

##create Travelelrs
30.times do
    Traveller.create(name: Faker::Name.name, age: Faker::Number.within(range: 20..104))  
end



##create Trips
150.times do
    start_date = Faker::Date.between(from: 3.years.ago, to: 2.years.from_now)
    end_date = Faker::Date.between(from: start_date, to: start_date + 2.years)
    bool = [true, false]
    status = nil
    if start_date > Time.now
        status = "upcoming"
    elsif start_date <= Time.now && end_date >= Time.now
        status = "ongoing"
    else 
        status = "completed"
    end
    Trip.create(start_date: start_date, end_date: end_date, vehicle: Faker::Space.launch_vehicle, status: status)
end


##create Locations
100.times do
    category = ["Gas Giant", "Rocky Planet", "Star", "Asteroid", "Moon", "Water Planet", "Galaxy", "Nebula"]
    name = [Faker::Space.planet, Faker::Space.moon, Faker::Space.galaxy, Faker::Space.nebula]
    bool = [true, false]
    Location.create(name: name.sample, temp: Faker::Number.within(range: 1..10), category: category.sample, rings: bool.sample, fauna: bool.sample, flora: bool.sample, daytime: bool.sample, landable: bool.sample, visited: bool.sample, gravity_level: Faker::Number.decimal(l_digits: 2))
end

traveller_ids = Traveller.all.map {|traveller| traveller.id}
trip_ids = Trip.all.map {|trip| trip.id}

200.times do
    traveller_id = traveller_ids.sample
    trip_id = trip_ids.sample

    existing = TravellerTrip.find_by(traveller_id: traveller_id, trip_id: trip_id)

    TravellerTrip.create(traveller_id: traveller_id, trip_id: trip_id) unless existing
end

# binding.pry