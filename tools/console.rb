require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
airbnb = Startup.new("Airbnb", "Joe", "services")
we_work = Startup.new("WeWork", "Minseo", "wework.com")

kim_minseo = VentureCapitalist.new("Minseo Kim", 50)
lim_vannida = VentureCapitalist.new("Vannida Lim", 10_000_000_000)

seed_1 = FundingRound.new(airbnb, kim_minseo, "seed a", 2_000_000)
seed_2 = FundingRound.new(we_work, lim_vannida, "angel", 1_000)
seed_3 = FundingRound.new(airbnb, kim_minseo, "seed a", 4_000_000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line