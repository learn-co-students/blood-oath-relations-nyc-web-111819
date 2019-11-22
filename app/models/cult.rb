class Cult
    attr_accessor 
    attr_reader :name, :location, :founding_year, :slogan 

    @@all = []

    def initialize(name, location, slogan)
        @name = name
        @location = location
        @founding_year = Time.now.strftime("%Y")
        @slogan = slogan
        self.class.all << self 
    end

    def self.all
        @@all
    end 

    def recruit_follower (follower)
        if follower.age >= minimum_age
            BloodOath.new(self, follower)
        else 
           puts "You are too young to join!"
        end
    end
    
    def blood_oaths
        BloodOath.all.select do |bloodoath|
            bloodoath.cult == self 
        end 
    end

    def followers 
        blood_oaths.map do |blood_oath|
            blood_oath.follower 
        end
    end

    def cult_population
        followers.length
    end 

    def self.find_by_name(name)
        self.all.find do |cult|
            cult.name == name
        end 
    end 

    def self.find_by_location(location)
        self.all.select do |cult|
            cult.location == location 
        end
    end

    def self.find_by_founding_year(year)
        self.all.select do |cult|
            cult.founding_year == year
        end
    end

    def average_age
        total = 0.0
        followers.each do |follower|
            total += follower.age 
        end
        total / cult_population
    end

    def my_followers_mottos
        followers.each do |follower|
            puts follower.life_motto
        end
    end

    def self.least_popular
        self.all.min_by {|cult| cult.cult_population }
    end

    def self.most_common_location
        locations = self.all.map do |cult|
            cult.location 
        end
        locations.max_by do |location|
            locations.count(location)
        end

    end

    def minimum_age
        30
    end 

end