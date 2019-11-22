class Follower

    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto

        @@all << self
    end

    def self.all
        @@all
    end

    def bloodoaths
        BloodOath.all.select do |bloodoath|
            bloodoath.follower == self
        end
    end

    def cults
        bloodoaths.map do |bloodoath|
            bloodoath.cult
        end
    end

    def join_cult(cult)
        BloodOath.new(self, cult)
    end
        # takes in an argument of a cult instance and adds this follower to the cult's list of followers


    def self.of_a_certain_age(age)
        Follower.all.select do |follower|
            follower.age >= age
        end
    end
# takes a Fixnum argument that is an age and returns an 
# Array of followers who are the given age or older

end