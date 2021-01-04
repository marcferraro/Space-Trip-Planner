class Traveller < ActiveRecord::Base
   has_many :traveller_trips
   has_many :trips, through: :traveller_trips
end