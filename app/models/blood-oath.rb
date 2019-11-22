
class BloodOath

    attr_accessor :follower, :cult
    attr_reader :initiation_date 

    @@all = []

    def initialize(cult, follower)
        @initiation_date = Time.now.strftime("%d-%m-%Y")
        @cult = cult
        @follower = follower
        self.class.all << self
    end

    def self.all 
        @@all 
    end

    def self.first_oath
        self.all[0].follower
    end 

end