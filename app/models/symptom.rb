class Symptom < ActiveRecord::Base
  validates :whichsymptom, :presence => true
  validates :whensymptom, :presence => true

  #attr_accessible :whichsymptom, :whensymptom

  belongs_to :user
end
