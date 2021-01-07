class Trip < ActiveRecord::Base
    has_many :traveller_trips
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

end