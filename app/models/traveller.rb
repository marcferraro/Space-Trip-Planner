class Traveller < ActiveRecord::Base
    has_many :traveller_trips
    has_many :trips, through: :traveller_trips

    @@pizza = "pizza"
    # def create_trip(date, vehicle, aegag)
    #     # v = when would you like to travel? 
    #     # v = where would you like to go?
    #     # v3 = what vehicle will you be taking?


    #     Trip.create(start_date: v, vehicle: v3)
    #     #puts self.trips.last
    # end

    # def login
    #     prompt id
    #     @@current_user = Traveller.find()
    # end

    # def create_new_account
    #     prompt - name, age
    #     traveller = Traveller.create(name, age)
    #     @@current_traveller = traveller
    #     puts traveller.id
    #     puts write down your id, youll need it to login
    # end
    def display_trips
        self.trips.each do |trip| 
            puts "\n#{trip.id} #{trip.name}"
        end
    end

    def delete_trip
        
        Trip.all.find_by(id: trip_id).delete
    end

    def trip_complete
        trip_id = gets.chomp
        Trip.all.find_by(id: trip_id).status = "Complete"
    end

    def self.current_pizza
        @@pizza
    end

end