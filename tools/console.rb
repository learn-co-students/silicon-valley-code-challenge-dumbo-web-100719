require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

facebook = Startup.new("facebook","mark", "technology")
apple = Startup.new("apple","steve", "technology")
uber = Startup.new("uber","george", "transportation")
lyft = Startup.new("lyf","james", "transportation")
seamless = Startup.new("seamless", "natalie", "food delivery")
blue_apron = Startup.new("blue apron","mark","food")

blackrock = VentureCapitalist.new("black rock", "3_000_000.00")
jpmorgan = VentureCapitalist.new("jpmorgan", "1_000_0000.00")
capital = VentureCapitalist.new("capital","500_000.00")

uber.pivot("ride sharing", "uber taxi")

startup_all= Startup.all



find_result = Startup.find_by_founder("george")
find_result2 = Startup.find_by_founder("mark")

# how this works?
startup_domains= Startup.domains

venture_all = VentureCapitalist.all
venture_club = VentureCapitalist.tres_commas_club

sign_contract1= lyft.sign_contract(capital,10_000.00,"Pre-Seed")

fund_round1 = FundingRound.new(facebook,blackrock,150_000.00,"Series C")
fund_round4 = FundingRound.new(facebook,blackrock,250_000.00,"Series C")
fund_round2 = FundingRound.new(blue_apron,capital,300_000.00, "Pre-Seed")
fund_round3 = FundingRound.new(blue_apron,jpmorgan,200_000.00, "Pre-Seed")
funding_all = FundingRound.all

num_fund_rounds = blue_apron.num_funding_rounds

funding_rounds = blue_apron.num_funding_rounds
funding_rounds2 = facebook.num_funding_rounds

venture_offer1 = blackrock.offer_contract(seamless,"Angel",1_000_000.00)
funding_round3 = blackrock.funding_rounds

venture_portfolio = blackrock.portfolio

biggest_invst1 = capital.biggest_investment
biggest_invst2 = blackrock.biggest_investment

domain_invested = blackrock.invested("technology")
binding.pry
0 #leave this here to ensure binding.pry isn't the last line