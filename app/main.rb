require_relative 'models/politician.rb'
require_relative '../db/config'
require 'active_record'

def find_by_state(state)
	puts "Senators:"
	students = Politician.find_all_by_state(state)and(title)
	puts "Reps:"
	p Politician.find_all_by_state(state).each {find_all_by_title("Rep")}
end

find_by_state("CA")

