class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :eventname, :eventtime
end
