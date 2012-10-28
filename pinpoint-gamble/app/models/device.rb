class Device < ActiveRecord::Base
  attr_accessible :os, :resolution, :type, :uuid
end
