class Startup
    attr_reader :founder, :domain 
    attr_accessor :name

    @@all = []
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self 
    end

    def pivot(domain, name)
        @domain = domain 
        @name = name
    end

    def self.all
        @@all 
    end

    def self.find_by_founder(founder)
        self.all.find do |startup|
            startup.founder == founder
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(type, investment, venture_capitalist)
        FundingRound.new(self,venture_capitalist, type, investment)
    end

    def funding_for_curr_startup 
        FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
    end

    def num_funding_rounds
        self.funding_for_curr_startup.count 
    end

    def total_funds
        self.funding_for_curr_startup.reduce(0) do |acc, curr_funding_round|
            acc += curr_funding_round.investment
        end
    end

    def investors
        investors_list = self.all.select do |funding_round|
            funding_round.venture_capitalist
        end
        investors_list.uniq!
    end

    def big_investors
        get_vc = funding_for_curr_startup.map do |funding_round|
            funding_round.venture_capitalist
        end
       tres_commas_vc = get_vc.select do |vc|
            binding.pry
            vc.tres_commas_club
       end
       tres_commas_vc.uniq!
    end

end