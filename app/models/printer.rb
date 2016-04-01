class Printer < ActiveRecord::Base
	has_one :city
	belongs_to :city
	validates :number, uniqueness: true
end
