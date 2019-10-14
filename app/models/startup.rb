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

    def pivot(domain,name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(founder_name)
        self.all.find {|startup| startup.founder == founder_name}
    end

    def self.domains
        domain = self.all.map {|startup| startup.domain}
        domain.uniq

    end

    def sign_contract(venture_capitalist,investment,type)
        FundingRound.new(self,venture_capitalist,investment,type)
    end

    def funding_rounds
        FundingRound.all.select {|fund| fund.startup == self}
    end
    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        total = 0
        funding_rounds.map {|fund| total += fund.investment}
        total
    end

    def investors
        investors = funding_rounds.map {|investor| investor.venture_capitalist}
        investors.uniq
    end

    def big_investors
        investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
        
    end

    def self.all
        @@all
    end
end
