class SubjectSchool < ActiveRecord::Base
  has_many :teachers
  attr_accessible :name
end
