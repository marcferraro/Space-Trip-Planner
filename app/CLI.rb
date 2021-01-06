class CLI

    def run
        
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
        end
    end

    def main_menu
        clear_screen
        
        upcoming_trips = @current_traveller.trips.count
        puts "Welcome #{@current_traveller.name} to Space Trip Planner."

        if upcoming_trips > 0
            puts "You have #{upcoming_trips} upcoming trips."
        end

        puts "What would you like to do?"
            
        prompt = TTY::Prompt.new
        selection = prompt.select("Main Menu", %w(View_Trips Create_New_Trip Write_Log Quit))

        case selection
        when "View_Trips"
            view_trips
        when "Create_New_Trip"
            create_new_trip
        when "Write_Log"

        end

    end

    def create_new_account
        clear_screen
        puts "Create a traveller name."
        name = gets.chomp.to_s
        clear_screen
        puts "What is your age?"
        age = gets.chomp

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

        @current_traveller = Traveller.find_by(id: id)
        clear_screen
        main_menu
    end



    def view_trips
        # binding.pry
        @current_traveller.display_trips

        prompt = TTY::Prompt.new
        selection = prompt.select("\nWhat would you like to do?", %w(View_Trip_Details Edit_Trip Cancel_Trip Mark_Trip_Complete))

        case selection
        when "View_Trip_Details"
            
        when "Edit_Trip"

        when "Mark_Trip_Complete"

        when "Cancel_Trip"
            cancel_trip
        end
    end



    def create_new_trip
        prompt = TTY::Prompt.new
        selection = prompt.select("Select an option to add one or more locations.", %w(Browse_All_Locations Find_Random_Locations Tailored_Locations Browse_By_Rating Go_Back ))
        case selection
        when "Browse_All_Locations"
            
        when "Find_Random_Locations"
            
        when "Tailored_Locations"

        when "Browse_By_Rating"

        when "Go_Back"
            main_menu
        end
    end

        

    def cancel_trip
        puts "Enter the ID of the trip you would like to cancel."
        trip_id = gets.chomp
        trip = Trip.find_by(id: trip_id)
        trip.destroy
        @current_traveller.delete
        # @current_traveller.delete_trip
        puts "Your trip has been deleted."
        binding.pry
        sleep 3
        clear_screen
        view_trips
    end



    # def get_age
    #     puts "What is your age?"
    #     age = gets.chomp
    #     #binding.pry
    #     age.class == Integer ? ("true") : ("Please enter an integer.")
    #     puts "hello"
    # end

   

    def clear_screen
        system "clear"
    end

end