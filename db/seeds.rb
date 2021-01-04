Trip.destroy_all
Location.destroy_all
TripLocation.destroy_all

trip1 = Trip.create(name: "My trip")
trip2 = Trip.create(name: "Return Trip")

location1 = Location.create(name: "Mars")
location2 = Location.create(name: "Jupiter")

trip_location1 = TripLocation.create(trip_id: trip1.id, location_id: location1.id)
trip_location2 = TripLocation.create(trip_id: trip2.id, location_id: location2.id)