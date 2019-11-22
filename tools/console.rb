require_relative '../config/environment.rb'
require_relative '../app/models/bloodoath.rb'
require_relative '../app/models/cult.rb'
require_relative '../app/models/follower.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console



cult1 = Cult.new("Gangs", "miami", 1932, "yes!")
cult2 = Cult.new("Mafia", "sf", 1272, "yay")
cult3 = Cult.new("Triads", "texas", 1572, "no")
cult4 = Cult.new("poop", "nyc", 2972, "nay!")

follower1 = Follower.new("kevin", 19, "guns")
follower2 = Follower.new("pat", 22, "knives")
follower3 = Follower.new("mike", 12, "rockets")
follower4 = Follower.new("ryan", 144, "rock")

bloodoath1 = BloodOath.new(follower1, cult1)
bloodoath2 = BloodOath.new(follower2, cult2)
bloodoath3 = BloodOath.new(follower3, cult3)
bloodoath4 = BloodOath.new(follower4, cult4)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
