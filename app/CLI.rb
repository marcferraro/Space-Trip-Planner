class CLI

    def run
        clear_screen
        puts "Welcome to Space Trip Planner"
        puts "<=>" * 10
        login
    end

    def login
        prompt = TTY::Prompt.new
        selection = prompt.select("Login", %w(Existing_Account Create_Traveller_Account Quit))

        clear_screen

        case selection
        when "Create_Traveller_Account"
            create_new_account
        when "Existing_Account"
            existing_account
        when "Quit"
            CLI.exit
        end
    end

    def main_menu
        clear_screen
        
        upcoming_trips = @current_traveller.trips.count
        puts "Welcome 🪐 #{@current_traveller.name} 🪐 to Space Trip Planner."

        if upcoming_trips > 0
            puts "\nYou have #{upcoming_trips} upcoming trips."
        end

        puts "<=>" * 12
            
        prompt = TTY::Prompt.new
        selection = prompt.select("\nMain Menu", %w(View_Trips Create_New_Trip Write_Log Quit))

        case selection
        when "View_Trips"
            view_trips
        when "Create_New_Trip"
            set_trip_date
        when "Write_Log"

        when "Quit"
            CLI.exit
        end

    end

    def create_new_account
        clear_screen
        puts "Create a traveller name."
        name = gets.chomp.to_s
        clear_screen
        age = get_age
    
        @current_traveller = Traveller.create(name: name, age: age)
        clear_screen
        puts "#{@current_traveller.id} is your ID. You will need this to login."
        sleep 3
        prompt = TTY::Prompt.new
        selection = prompt.select("Hit Enter to continue.", %w(Continue))
        main_menu
        clear_screen
    end

    def existing_account
        # make sure to not crash if ID is not present
        clear_screen
        puts "Enter Traveller ID"
        id = gets.chomp
        if is_integer(id)
            @current_traveller = Traveller.find_by(id: id)
            clear_screen
            main_menu
        else
            puts "Please enter an integer."
            sleep 2
            existing_account
        end
    end

    def view_trips
        clear_screen
        @current_traveller.display_trips

        prompt = TTY::Prompt.new
        selection = prompt.select("\nWhat would you like to do?", %w(View_Trip_Details Edit_Trip Cancel_Trip Mark_Trip_Complete Main_Menu))

        case selection
        when "View_Trip_Details"
            view_trip_details
        when "Edit_Trip"
            edit_trip
        when "Mark_Trip_Complete"
            mark_trip_complete
        when "Cancel_Trip"
            cancel_trip

        when "Main_Menu"
            main_menu
        end
    end

    def view_trip_details
        puts "Please enter a trip ID."
        id = gets.chomp
        clear_screen
        @current_traveller.trips.find(id).trip_details

        enter_to_return
    end

    def edit_trip
        clear_screen
        id = enter_id("a trip")
        clear_screen
        trip = @current_traveller.trips.find(id)
        trip.trip_details
        
        prompt = TTY::Prompt.new
        selection = prompt.select("\nWhat would you like to change?", %w(Trip_Name Start_Date End_Date Vehicle Itinerary Return))
        
        case selection
        when "Trip_Name"
        when "Start_Date"
        when "End_Date"
        when "Vehicle"
        when "Itinerary"
        when "Return"
            view_trips
        end

    end

    def mark_trip_complete
        id = enter_id("a trip")
        clear_screen
        @current_traveller.trips.find(id).complete
        puts "Status set to complete. 🚀 Journey Complete! 🚀"

        enter_to_return
    end

    def set_trip_date
        clear_screen
        puts "Enter a date to start your trip."
        start_date = gets.chomp
        puts "Enter a date to end your trip."
        end_date = gets.chomp

        trip = Trip.create(start_date: start_date, end_date: end_date)
        
        TravellerTrip.create(traveller_id: @current_traveller.id, trip_id: trip.id)
        create_trip_locations
    end

    def create_trip_locations
        clear_screen
        prompt = TTY::Prompt.new
        selection = prompt.select("Select an option to add one or more locations.", %w(Browse_All_Locations Find_Random_Locations Tailored_Locations Browse_By_Rating Finish_Creation Return ))
        
        case selection
        when "Browse_All_Locations"
            
        when "Find_Random_Locations"
            find_random_location
        when "Tailored_Locations"

        when "Browse_By_Rating"

        when "Finish_Creation"
            finish_creation
        when "Return"
            @current_traveller.trips.all.last.destroy
            main_menu
        end
        
        create_trip_locations
    end

    def find_random_location
        clear_screen
        random_locations = []
        3.times {random_locations << Location.all.sample} 
        
        random_locations.each {|location| puts "#{location.id}. #{location.name}"}

        puts "Enter the index of the location of the trip you would like to add to your itinerary."

        location_id = gets.chomp
        
        if is_integer(location_id)
            trip_id = @current_traveller.trips.last.id
            TripLocation.create(trip_id: trip_id, location_id: location_id)
            puts "Location added to itinerary."
            sleep 2
            create_trip_locations
        else
            puts "Please enter an integer."
            sleep 2
            find_random_location
        end
    end

    def finish_creation
        clear_screen
        puts "Please enter a name for your trip."
        name = gets.chomp
        @current_traveller.trips.all.last.update(name: name)
        #add a generative vehicle list later
        puts "Please enter the vehicle you would like to take."
        vehicle = gets.chomp
        @current_traveller.trips.all.last.update(vehicle: vehicle)
        clear_screen
        
        @current_traveller.trips.all.last.trip_details

        prompt = TTY::Prompt.new
        selection = prompt.select("\nHere is your trip! Would you like to keep it?", %w(Save Discard Restart))

        case selection
        when "Save"
            puts "Trip saved. Congratulations!"
            sleep 2
            main_menu
        when "Discard"
            @current_traveller.trips.all.last.destroy
            puts "Trip Discarded. Have a nice day!"
            sleep 2
            main_menu
        when "Restart"
            @current_traveller.trips.all.last.destroy
            puts "Let's give it another shot."
            sleep 2
            set_trip_date
        end
        # location_indexes.each do |location_index|
        #     TripLocation.create(trip_id: trip.id, location_id: location_index)
        # end
    end

    def cancel_trip
        puts "Enter the ID of the trip you would like to cancel."
        trip_id = gets.chomp
        # trip = Trip.find_by(id: trip_id)
        @current_traveller.trips.all.find(trip_id).destroy
        @current_traveller.reload
        puts "Your trip has been deleted."
        sleep 2
        clear_screen
        view_trips
    end



    def get_age
        puts "What is your age?"
        age = gets.chomp

        is_integer(age) ? age.to_i : (puts "Please enter an integer."; get_age)
    end

   
    def is_integer(string)
        true if Integer(string) rescue false
    end


    def clear_screen
        system "clear"
    end

    def self.exit
        system "clear"
        puts "Safe Travels!"
        # sleep 2
        exit!
    end

    def enter_to_return
        prompt = TTY::Prompt.new
        selection = prompt.select("\nPress Enter to Return.", %w(Return))

        case selection
        when "Return"
            view_trips
        end
    end

    #enter either a or an, then your ID type as string. ex: a trip, an object. set method equal to id
    def enter_id(a_or_an_id_type)
        puts "Please enter #{a_or_an_id_type} ID."
        gets.chomp
    end

end