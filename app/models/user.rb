class User < ActiveRecord::Base
  validates :username, :presence => true
  validates :password, :presence => true,
            :uniqueness => true,
            :length => { :is => 8 }
  validates :email, :presence => true,
            :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

  has_many :symptoms, :dependent => :destroy
  has_many :events,  :dependent => :destroy


  accepts_nested_attributes_for :symptoms, :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  accepts_nested_attributes_for :events, :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }


  attr_accessible :email, :password, :username, :events_attributes, :symptoms_attributes







end
