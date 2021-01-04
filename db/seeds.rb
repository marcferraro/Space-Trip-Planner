Trip.destroy_all
Location.destroy_all
TripLocation.destroy_all
TravellerTrip.destroy_all
Traveller.destroy_all



traveller1 = Traveller.create(name: "Marc")
traveller2 = Traveller.create(name: "Rachelle")


trip1 = Trip.create(name: "My trip")
trip2 = Trip.create(name: "Return Trip")

location1 = Location.create(name: "Mars")
location2 = Location.create(name: "Jupiter")

traveller_trip1 = TravellerTrip.create(traveller_id: traveller1.id, trip_id: trip1.id)
traveller_trip2 = TravellerTrip.create(traveller_id: traveller2.id, trip_id: trip2.id)

trip_location1 = TripLocation.create(trip_id: trip1.id, location_id: location1.id)
trip_location2 = TripLocation.create(trip_id: trip2.id, location_id: location2.id)

