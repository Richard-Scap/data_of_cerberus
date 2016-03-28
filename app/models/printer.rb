class Printer < ActiveRecord::Base
	has_one :city
	validates :number, uniqueness: true
end
