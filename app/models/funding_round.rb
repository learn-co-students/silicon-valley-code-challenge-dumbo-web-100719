require 'pry'

class FundingRound
    @@all = []

    attr_reader :type, :venture_capitalist, :startup
    attr_accessor :investment

    def initialize(type, venture_capitalist, startup, investment)
        @type = type
        @venture_capitalist = venture_capitalist
        @startup = startup
        @investment = investment
        @@all << self
    end

    def self.all
        @@all
    end

end
