
class VentureCapitalist
    attr_accessor :name,:total_worth
    @@all = []
    def initialize(name,total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.tres_commas_club
        self.all.select {|vent| vent.total_worth.to_i > 1_000_000}
    end

    def offer_contract(startup,type,amount)
        FundingRound.new(startup,self,amount,type)
    end

    def portfolio
       funding_rounds.select {|fund| fund.startup}.uniq
        
    end

    def funding_rounds
        FundingRound.all.select {|fund| fund.venture_capitalist == self }
    end

    def biggest_investment
        largest_funding = nil

        funding_rounds.map do |round| 
            if largest_funding ==  nil || round.investment > largest_funding.investment
            largest_funding = round 
            end
        end
      largest_funding
    end

    def invested(domain)
        total_invested = 0
        funding_rounds.select {|fund| total_invested += fund.investment}
        total_invested
    end

    def self.all
        @@all
    end
end
