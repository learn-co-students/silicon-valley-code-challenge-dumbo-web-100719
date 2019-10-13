
class VentureCapitalist

attr_accessor :name, :worth
@@all = []

def initialize (name, worth)
    @name = name
    @worth = worth
    @@all << self
end

def total_worth
    @worth
end

def self.all
    @@all
end

def self.tres_commas_club
    @@all.select do |vc|
        vc.worth > 1000000000
    end
end

def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type.to_s, amount.abs.to_f)
end

def funding_rounds
    FundingRound.all.select{|fr| fr.venture_capitalist == self}
end

def portfolio
    self.funding_rounds.map {|round| round.startup}.uniq
end

def biggest_investment
    largest = 0
    self.funding_rounds.each do |fr|
        if fr.investment > largest
            largest = fr.investment
        end
    end
    largest
end

def invested(area)
    total = 0
    self.funding_rounds.each do |fr|
        if fr.startup.domain == area
            total += fr.investment
        end
    end
    total
end

end