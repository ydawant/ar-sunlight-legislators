require_relative 'models/politician.rb'
require_relative '../db/config'
require 'active_record'

def find_by_state(state)
  puts "Senators:"
  Politician.find_all_by_state_and_title(state, "Sen").each {|x| puts x}
  puts "Reps:"
  Politician.find_all_by_state_and_title(state, "Rep").each {|x| puts x}
end

find_by_state("CA")

def percentage(gender)
  gender_count_sens = Politician.find_all_by_gender_and_title(gender, "Sen").count
  gender_count_reps = Politician.find_all_by_gender_and_title(gender, "Rep").count
  p all_senators = Politician.find_all_by_title("Sen").count
  p all_reps = Politician.find_all_by_title("Rep").count
  p senator_percentage = (gender_count_sens/all_senators.to_f) * 100
  p rep_percentage = (gender_count_reps/all_reps.to_f) * 100

  puts "#{gender} Senators: #{gender_count_sens} (#{senator_percentage.to_i}%)"
  puts "#{gender} Representatives: #{gender_count_reps} (#{rep_percentage.to_i}%)"
end

percentage("F")

def active_congress
  reps = Politician.find_all_by_in_office_and_title(true, "Rep")
  state_reps = reps.group_by {|rep| rep.state }
  ordered_reps = state_reps.sort_by {|state, state_reps| state_reps.count}.reverse
  ordered_reps.each do |state, state_reps|
  	puts "#{state}: 2 Senators. #{state_reps.count} Representative(s)"
  end
end

active_congress


def print_all
  total_num_sen = Politician.find_all_by_title("Sen").count
  puts "Senators: (#{total_num_sen})"
  total_num_reps = Politician.find_all_by_title("Rep").count
  puts "Representatives: (#{total_num_reps})"
end

def delete_inactive
  Politician.find_all_by_in_office(false).each {|politician| politician.delete}
end

print_all
delete_inactive
print_all

