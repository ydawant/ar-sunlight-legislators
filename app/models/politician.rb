require 'active_record'
require 'debugger'

class Politician < ActiveRecord::Base

	attr_reader :name, :title, :party, :state, :in_office, :gender, :phone, :congress_office, :birthdate

	def self.import_from_csv(attributes = {})
		clean_attributes = {:name => "#{attributes["firstname"]} #{attributes["middlename"]} #{attributes["lastname"]} #{attributes["name_suffix"]}",
		:title => attributes["title"],
		:party => attributes["party"],
		:state => attributes["state"],
		:in_office => attributes["in_office"],
		:gender => attributes["gender"],
		:phone => attributes["phone"],
		:congress_office => attributes["congress_office"],
		:birthdate => attributes["birthdate"] }

		Politician.new(clean_attributes)
	end

	def to_s
		"#{name}, #{state}, #{title}"
	end
end
