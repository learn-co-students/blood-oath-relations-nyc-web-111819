require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# blood_oath1 = BloodOath.new
clown_lovers = Cult.new("Clown Lovers", "California", "We love clowns!")
flatiron_friends = Cult.new("Flatiron Friends", "NYC", "We love code!")
new_yorkers = Cult.new("New Yorkers", "NYC", "Go Yankees!")
# cult1.recruit_follower("Mike")
mike = Follower.new("Mike", 81, "Always winning")
tony = Follower.new("Tony", 30, "I love code")
anna = Follower.new("Anna", 26, "On AIM 24/7")
zalmy = Follower.new("Zalmy", 26, "Keep on keepin' on")
mike.join_cult(clown_lovers)
tony.join_cult(clown_lovers)
clown_lovers.recruit_follower(anna)
anna.join_cult(flatiron_friends)
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
