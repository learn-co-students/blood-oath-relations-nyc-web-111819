class Cult

    attr_accessor :name, :location, :founding_year, :slogan
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        BloodOath.new(follower, self)

    end
    
    def bloodoaths
        BloodOath.all.select do |bloodoath|
            bloodoath.cult == self
        end.count
    end

    def followers
        bloodoaths.map do |bloodoath|
            bloodoath.follower
        end
    end

    def cult_population
        followers.length
    end

    def self.find_by_name(name)
        Cult.all.select do |cult|
            cult.name == name
        end
    end

    def self.find_by_location(location)
        Cult.all.select do |cult|
            cult.location == location
        end

    end

    def self.find_by_founding_year(founding_year)
        Cult.all.select do |cult|
            cult.founding_year == founding_year
        end
    end
    
    def average_age
        total_age = followers.reduce(0) do |sum, followers|
            sum + followers.age 
        end
        total_age / followers.length
    end

    def my_followers_mottos
        followers.each do |follower|
            print follower.life_motto
        end

    end
end

# Cult#my_followers_mottos
# prints out all of the mottos for this cult's followers