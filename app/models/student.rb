require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base

	def name
		return "#{first_name} #{last_name}"
	end

	def age
		age = Time.now.year - birthday.year - (Time.now.yday < birthday.yday ? 1 : 0)
	end
end