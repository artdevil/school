class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  attr_accessible :city, :country, :line_1, :line_2, :mobile, :province, :telephone, :addressable_id, :addressable_type
  validates :city, :country, :line_1, :province, :telephone, :presence => true
end
