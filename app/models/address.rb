class Address < ActiveRecord::Base
  attr_accessible :city, :country, :line_1, :line_2, :mobile, :province, :telephone
end
