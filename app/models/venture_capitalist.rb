class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end 

    def self.all 
        @@all 
    end 

    def self.tres_commas_club
        self.all.select do |vc|
            vc.total_worth > 1_000_000_000
        end
    end

    def offer_contract(type, investment, startup)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self
        end
    end

    def portfolio
        funding_rounds.map do |funding_round|
            funding_round.startup 
        end.uniq
        #startup_list.uniq!
    end

    def biggest_investment
    #   binding.pry
        funding_rounds.min_by do |funding_round|
            funding_round.investment
       end
    end

    def invested(domain)
        funding_rounds.select do |funding_round|
            if funding_round.domain == domain
                funding_round.investment
            end
        end
    end


end
