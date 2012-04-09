class Subject < ActiveRecord::Base
  has_many :teachers
  attr_accessible :name,:description
  
  validates :name,:description, :presence => true
end
