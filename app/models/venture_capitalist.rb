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
        self.all.select do |one_venture|
            one_venture.total_worth > 1_000_000
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self
        end
    end

    def portfolio
        startup_array = self.funding_rounds.map do |funding_round|
            funding_round.startup
        end
        startup_array.uniq
    end

    def biggest_investment
        self.funding_rounds.reduce(nil) do |memo, funding_round|
            if memo == nil
                memo = self.funding_rounds[0]
            end
            binding.pry
            if (funding_round.investment > memo.investment)
                memo = funding_round
                memo
            else
            memo
            end
        end
    end

    def invested(domain)
        funding_rounds_by_domain = self.funding_rounds.select do |funding_round|
            funding_round.startup.domain == domain
        end

        funding_rounds_by_domain.reduce(0.0) do |memo, funding_round|
            memo = memo += funding_round.investment
            memo
        end
    end

end
