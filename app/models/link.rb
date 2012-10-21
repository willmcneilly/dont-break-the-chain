class Link < ActiveRecord::Base
  attr_accessible :complete, :completedat, :information, :timespent
  belongs_to :chain
end
