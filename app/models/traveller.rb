class Traveller < ActiveRecord::Base
    has_many :traveller_trips
    has_many :trips, through: :traveller_trips

    
    # def create_trip(date, vehicle, aegag)
    #     # v = when would you like to travel? 
    #     # v = where would you like to go?
    #     # v3 = what vehicle will you be taking?


    #     Trip.create(start_date: v, vehicle: v3)
    #     #puts self.trips.last
    # end

    def display_trips
        count = 1
        self.trips.each do |trip| 
            puts "#{count}. #{trip.name}\nID: #{trip.id}\n"
            count += 1
        end
    end

    def trip_complete
        trip_id = gets.chomp
        Trip.all.find_by(id: trip_id).status = "Complete"
    end
  
end
