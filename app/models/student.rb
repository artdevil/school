class Student < ActiveRecord::Base
  has_one :parent
  belongs_to :teacher
  has_one :address, :as => :addressable
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:nis]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :address_attributes, :parent_attributes, :teacher_id,
                  :name, :nis, :gender, :birth_place, :birth_day, :religion, :level, :photo_student
  
  validates :teacher_id, :name, :nis, :gender, :birth_place, :birth_day, :religion, :level, :presence => true
  validates :nis, :numericality => { :only_integer => true },
                  :length => {:minimum => 6},
                  :uniqueness => true
  
  accepts_nested_attributes_for :address, :parent
  
  mount_uploader :photo_student, PhotoStudentUploader
  # attr_accessible :title, :body
end
