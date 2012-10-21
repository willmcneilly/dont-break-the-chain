class Chain < ActiveRecord::Base
  attr_accessible :active, :days, :information, :name, :start
  has_many :links
end
