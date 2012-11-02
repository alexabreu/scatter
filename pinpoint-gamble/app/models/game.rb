class Game < ActiveRecord::Base
  has_many :players, :through => :broadcasts
  
  attr_accessible :end, :start
end
