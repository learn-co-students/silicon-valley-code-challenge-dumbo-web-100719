class Startup

    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        self.domain = domain
        self.name = name
    end

    def self.all
        @@all
    end

    def find_by_founder(founder_name)
        Startup.all.find do |one_startup|
            one_startup.founder == founder_name
        end

    end

    def domains 
        Startup.all.map do |one_startup|
            one_startup.domain
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type.to_s, investment.abs.to_f)
    end

    def funding_rounds
        FundingRound.all.select do |fundinground|
            fundinground.startup == self
        end
    end

    def num_funding_rounds
        self.funding_rounds.count
    end

    def total_funds
        self.funding_rounds.reduce(0.0) do |memo, funding_instance|
            memo = memo += funding_instance.investment.to_f
            memo
        end
    end

    def investors
        investor_array = self.funding_rounds.map do |funding_round|
            funding_round.venture_capitalist
        end
        investor_array.uniq
    end

    def big_investors
        big_array = self.investors.select do |investor|
            investor.total_worth > 1_000_000
        end
        big_array.uniq
    end

    private
    def domain=(new_domain)
        @domain = new_domain
    end

end
