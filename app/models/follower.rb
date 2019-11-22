class Follower

    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        self.class.all << self 
        @life_motto = life_motto
    end 

    def self.all
        @@all
    end 

    def join_cult(cult)
        if self.age >= cult.minimum_age
            BloodOath.new(cult, self)
        else
           puts "You are too young to join!"
        end 
    end 

    def self.of_a_certain_age(num)
        self.all.select do |follower|
            follower.age >= num 
        end 
    end 
    
    def blood_oaths
        BloodOath.all.select do |blood_oath|
            blood_oath.follower == self 
        end
    end
    
    def cults 
        blood_oaths.map do |blood_oath|
            blood_oath.cult 
        end
    end

    def my_cults_slogans
        cults.each do |cult|
            puts cult.slogan 
        end
    end

    def self.most_active(num=1)
        self.all.max_by(num) {|follower| follower.cults.length}
    end

    def self.top_ten
        self.most_active(10)
    end

    def fellow_cult_members
        fellow_members = []
        cults.each do |cult|
            cult.followers.each do |follower|
              if !fellow_members.include?(follower)
                fellow_members << follower
              end 
            end 
        end 
        fellow_members.delete(self)
        fellow_members
    end 

end