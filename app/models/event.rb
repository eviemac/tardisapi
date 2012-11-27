class Event < ActiveRecord::Base
  validates :eventname, :presence => true
  validates :eventtime, :presence => true

  belongs_to :user

  #attr_accessible :eventname, :eventtime
end
