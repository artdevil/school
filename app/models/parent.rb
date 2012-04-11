class Parent < ActiveRecord::Base
  belongs_to :students
  attr_accessible :carers_job, :carers_name, :carers_phone, :father_job, :father_name, :father_phone, :mother_job, :mother_name, :mother_phone, :student_id
  validates :father_job, :father_name, :father_phone, :mother_job, :mother_name, :mother_phone, :presence => true
end
