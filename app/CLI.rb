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
            existing_Account
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
        selection = prompt.select("Main Menu", %w(View_Trips New_Trip Write_Log Quit))

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

    def existing_Account
        # clear_screen
        # puts "Enter Traveller Name"
        # name = gets.chomp
        clear_screen
        puts "Enter Traveller ID"
        id = gets.chomp

        @current_traveller = Traveller.find_by(id)
        clear_screen
        main_menu
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