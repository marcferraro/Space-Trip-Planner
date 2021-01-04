class Trip < ActiveRecord::Base
    #belongs_to :travellers
    has_many :trip_locations
    has_many :locations, through: :trip_locations
end