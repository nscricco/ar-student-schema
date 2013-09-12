require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
	validates :email, format: { with: /.+[@]{1}.+[.]{1}.{2,}/, message: "Please enter a valid email address"}, uniqueness: true
	validates :age, numericality: { greater_than: 5, message: "Must be older than 5 years of age"}
	validates :phone_number_length_only_digits, numericality: {greater_than: 10, message: "Please enter a phone number with more than 10 digits"}

	def name
		return "#{first_name} #{last_name}"
	end

	def age
		Time.now.year - birthday.year - (Time.now.yday < birthday.yday ? 1 : 0)
	end

	def phone_number_length_only_digits
		phone.gsub(/[^0-9]/,'').length
	end
end