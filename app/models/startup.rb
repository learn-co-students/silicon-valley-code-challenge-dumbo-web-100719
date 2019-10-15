require 'pry'

class Startup
    # @@all = []

    attr_accessor :name
    attr_reader :founder, :domain

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        # @@all << self
    end

    def self.all
        # @@all
        FundingRound.all.map do |round|
            round.startup
        end
    end

    def find_by_founder(founder)
        FundingRound.all.find do |round|
            round.startup == self
        end
        self.name
    end

    def startups
        FundingRound.all.select do |round|
            round.startup == self
        end
    end

    def self.domains
        #Startup.domains should return an array of all of the domain names 
        #ask Graham about this! --> is this using a single source of truth
        #i think it is, but want to talk about it to make sure
        self.all.map do |startup|
            startup.domain
        end
    end

    # def pivot
    # end

    def sign_contract(type, venture_capitalist, investment)
        FundingRound.new(type, venture_capitalist, self, investment)
    end

    def num_funding_rounds
        num_funding_rounds = FundingRound.all.select do |round|
            round.startup == self
        end
        num_funding_rounds.size
    end

    # def total_funds
        #funding rounds returns an array of the funding rounds
        #we can take the investments from each funding round
        #and add them together?
    # end

    def total_funds
       investment = funding_rounds.map do |round|
            round.investment
       end
       investment.sum
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.startup == self
        end
    end

    def investors
       self.funding_rounds.map do |round|
        round.venture_capitalist
       end
    end

    def big_investors
        investors.select do |investor|
            investor.total_worth >= 1_000_000_00
        end
    end

    def pivot(domain)
        @domain = domain
    end
    
    
end
