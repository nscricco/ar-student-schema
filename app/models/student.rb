require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base

	def name
		return "#{first_name} #{last_name}"
	end

	def age
		return Time.now.year - birthday.year
	end
end