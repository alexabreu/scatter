class Device < ActiveRecord::Base
  belongs_to :player
  
  attr_accessible :os, :resolution, :type, :uuid
end
