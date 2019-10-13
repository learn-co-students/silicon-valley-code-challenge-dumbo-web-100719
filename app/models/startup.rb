
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

def pivot(new_domain, new_name)
    self.domain(new_domain)
    self.name = new_name

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

def sign_contract (venture_capitalist, type, investment)
    boop = FundingRound.new(self, venture_capitalist, type.to_s, investment.abs.to_f)
end

def num_funding_rounds
    FundingRound.all.select{|fr| fr.startup == self}.size
end

def total_funds
    total = 0
    funding_rounds = FundingRound.all.select { |fr| fr.startup == self}
    funding_rounds.each do |round|
        total += round.investment
    end
    total
end

def investors
    funding_rounds = FundingRound.all.select{|fr| fr.startup == self}
    funding_rounds.map {|round| round.venture_capitalist}.uniq
end

def big_investors
    self.investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
end

private

def domain=(new_domain)
    @domain = new_domain
end

end