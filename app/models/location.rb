class Location < ActiveRecord::Base
    has_many :trip_locations
    has_many :trips, through: :trip_locations
    #belongs_to :travellers, through: :trip_locations
end