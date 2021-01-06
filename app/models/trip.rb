class Trip < ActiveRecord::Base
    has_many :traveller_trips
    has_many :travellers, through: :traveller_trips
    has_many :trip_locations
    has_many :locations, through: :trip_locations




    
end