class Broadcast < ActiveRecord::Base
  belongs_to :game
  belongs_to :player
  
  attr_accessible :inside, :lat, :lng, :x, :y
end
