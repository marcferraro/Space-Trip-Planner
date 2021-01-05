class CLI

    def run
        clear_screen
        puts "Welcome to Space Trip Planner"
        puts "<=>" * 10
        login
    end

    def login
        prompt = TTY::Prompt.new
        selection = prompt.select("Main Menu", %w(Create_Traveller_Account New_Account Quit))

        clear_screen

        case selection
        when "Create_Traveller_Account"
            create_new_account
        when "New_Account"
            puts 2
        end

    end

    def create_new_account
        clear_screen
        puts "Create a traveller name."
        name = gets.chomp.to_s
        clear_screen
        get_age
        binding.pry
    end

    def get_age
        puts "What is your age?"
        age = gets.chomp
        if age.class != int
            puts "Please enter an integer."
            get_age
        end
    end

    def clear_screen
        system "clear"
    end

end