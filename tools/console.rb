require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

companyA = Startup.new("Tom","companyFounderA", "domainA")
companyB = Startup.new("Forest", "companyFounderB", "domainB")
companyC = Startup.new("Arnold","companyFounderA", "domainC")

Ruben = VentureCapitalist.new("Ruben", 1_100_000)
Jennifer = VentureCapitalist.new("Jennifer", 1_000_000)

roundA = FundingRound.new(companyA, Ruben, "tech", 100000)
roundB = FundingRound.new(companyB, Jennifer, "finance", 30000)

roundC = companyA.sign_contract(Ruben, "newtype", 300_000)
roundD = companyA.sign_contract(Jennifer, "othertype", 20)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line