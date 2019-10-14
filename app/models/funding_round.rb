class FundingRound
    attr_accessor :investment,:type
    attr_reader :venture_capitalist, :startup

    @@all = []
    def initialize(startup, venture_capitalist,investment,type)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @investment = investment
        @type = type
        @@all << self
    end

    def self.all
        @@all
    end
end
