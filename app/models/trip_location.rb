class TripLocation < ActiveRecord::Base
    belongs_to :trip
    belongs_to :location
    #belongs_to :travellers, through: :trips
end