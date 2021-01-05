class TripLocation < ActiveRecord::Base
    belongs_to :trip
    belongs_to :location
end