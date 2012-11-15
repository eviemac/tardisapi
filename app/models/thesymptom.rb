class Thesymptom < ActiveRecord::Base
  belongs_to :user

  attr_accessible :whensymptom, :whichsymptom

end
