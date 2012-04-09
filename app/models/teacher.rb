class Teacher < ActiveRecord::Base
  has_one :address, :as => :addressable
  belongs_to :subject
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :address_attributes, :name, :nip, :gender, :birth_place, :birth_day,
                  :religion, :level, :picture, :subject_id
  mount_uploader :picture, PictureUploader
  # attr_accessible :title, :body
  validates :name, :nip, :gender, :birth_place, :birth_day,
                  :religion, :level, :picture, :subject_id, :presence => true
  validates :nip, :numericality => { :only_integer => true },
                  :length => {:minimum => 6}
  accepts_nested_attributes_for :address
end