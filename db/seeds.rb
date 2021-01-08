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
trip_name_count = 1
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
    Trip.create(name: "Trip #{trip_name_count}", start_date: start_date, end_date: end_date, vehicle: Faker::Space.launch_vehicle, status: status)
    trip_name_count += 1
end

##create Locations
100.times do
    category = ["Gas Giant", "Rocky Planet", "Star", "Asteroid", "Moon", "Water Planet", "Galaxy", "Nebula", "Star Cluster", "Black Hole", "Quasar", "Space Station"]
    name = [Faker::Space.planet, Faker::Space.moon, Faker::Space.galaxy, Faker::Space.nebula, Faker::Space.star_cluster, Faker::Space.star]
    bool = [true, false]
    Location.create(name: name.sample, temp: Faker::Number.within(range: 0..5800), category: category.sample, rings: bool.sample, fauna: bool.sample, flora: bool.sample, daytime: bool.sample, landable: bool.sample, visited: bool.sample, gravity_level: Faker::Number.within(range: 1..50))
end

#create traveller_trips
traveller_ids = Traveller.all.map {|traveller| traveller.id}
trip_ids = Trip.all.map {|trip| trip.id}

200.times do
    traveller_id = traveller_ids.sample
    trip_id = trip_ids.sample

    existing = TravellerTrip.find_by(traveller_id: traveller_id, trip_id: trip_id)

    TravellerTrip.create(traveller_id: traveller_id, trip_id: trip_id) unless existing
end


#create trip_locations
trip_ids = Trip.all.map {|trip| trip.id}
location_ids = Location.all.map {|location| location.id}

25000.times do
    trip_id = trip_ids.sample
    location_id = location_ids.sample

    exists = TripLocation.find_by(trip_id: trip_id, location_id: location_id)

    TripLocation.create(trip_id: trip_id, location_id: location_id) unless exists
end