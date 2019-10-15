require 'pry'

class VentureCapitalist
    # @@all = []

    attr_accessor :name
    attr_reader :total_worth

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        # @@all << self
    end

    def self.all
        # @@all
        FundingRound.all.map do |round|
            round.venture_capitalist
        end
    end

    def self.tres_commas_club
        #want to look self.all
        self.all.select do |capitalist|
            capitalist.total_worth >= 1_000_000_000
        end
    end

    def offer_contract(type, startup, investment)
       FundingRound.new(type, self, startup, investment) 
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    def portfolio
        funding_rounds.map do |round|
            round.startup
        end
    end

    def biggest_investment
        biggest_investment = 0

        funding_rounds.each do |round|
            
            if round.investment > biggest_investment
                biggest_investment = round.investment
            end
        end
        biggest_investment
    end

    # def invested(domain)
    #    total = funding_rounds.map do |round|
    #         round.investment
    #     end
    #     total.sum
    # end

    def invested(domain)
        domain_invested = funding_rounds.select do |round|
             round.startup.domain == domain
        end
        total = domain_invested.map do |round|
            round.investment
        end
        total.sum
    end

end
