class Trip < ActiveRecord::Base
    has_many :traveller_trips, dependent: :destroy
    has_many :travellers, through: :traveller_trips
    has_many :trip_locations
    has_many :locations, through: :trip_locations


    def trip_details
    puts "<=> #{self.name} <=>\n"
    if self.status == "Complete"
        puts "\nStatus: #{self.status} 💫"
    end
    puts "\nStart Date: #{self.start_date}"
    puts "End Date: #{self.end_date}"
    puts "\nVehicle: #{self.vehicle}"
    puts "\nItinerary:"
    count = 1
    self.locations.each {|location| puts "#{count}. #{location.name}"; count += 1}
  end
    
    def complete
        self.update(status: "Complete")
    end

    def edit_trip_name
        system "clear"
        puts "Enter new trip name."
        trip_name = gets.chomp 
        self.update(trip_name: trip_name)
    end

    def edit_start_date
        system "clear"
        puts "Enter new start date."
        start_date = gets.chomp 
        self.update(start_date: start_date)
    end

    def edit_end_date
        system "clear"
        puts "Enter new end date."
        end_date = gets.chomp 
        self.update(end_date: end_date)
    end

    def  edit_vehicle
        system "clear"
        puts "Enter new vehicle."
        vehicle = gets.chomp 
        self.update(vehicle: vehicle)
    end

    def edit_itinerary
        # system "clear"
        # puts "Enter new start date."
        # start_date = gets.chomp 
        # self.update(start_date: start_date)
    end

   

end