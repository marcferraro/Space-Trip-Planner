class Location < ActiveRecord::Base
    has_many :trip_locations
    has_many :trips, through: :trip_locations

    def location_details
      puts "\n<=> #{self.name} <=>"
      puts "ID: #{self.id}"
      puts "Category: #{self.category} ✨"
      puts "\nTemperature: #{self.temp} 🌨"
      puts "Rings: #{self.rings} 🪐"
      puts "Fauna: #{self.fauna} 👽"
      puts "Flora: #{self.flora} 🌱"
      puts "Brightness: #{self.daytime} 😎"
      puts "Landable: #{self.landable} 🚀"
      puts "Visited: #{self.visited} 🛸"
      puts "Gravity Level: #{self.gravity_level} 🛰"
      end
end