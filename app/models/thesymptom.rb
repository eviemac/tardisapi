class Thesymptom < ActiveRecord::Base
  attr_accessible :whensymptom, :whichsymptom

  belongs_to :user



end
