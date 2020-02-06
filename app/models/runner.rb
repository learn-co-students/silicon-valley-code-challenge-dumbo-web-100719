require 'pry'

require_relative 'startup'
require_relative 'funding_round'
require_relative 'venture_capitalist'

pied_piper = Startup.new("Pied Piper", "Richard Hendricks", "PiedPiper.com")
nip_alert = Startup.new("Nip Alert", "Nelson Bigetti", "NipAlert.com")
aviato = Startup.new("Aviato", "Erlich Bachman", "Aviato.com")

russ_hanneman = VentureCapitalist.new("Russ Hanneman", 1_000_000_000)
raviga = VentureCapitalist.new("Raviga", 5_000_000_000)
# monica_hall = VentureCapitalist.new("Monica Hall", 20_000_000)
erlich_bachman = VentureCapitalist.new("Erlich Bachman", 6_000_000)

pied_piper_round_one = FundingRound.new("incubator", erlich_bachman, pied_piper, 5_000.0)
pied_piper_round_two = FundingRound.new("Series A", raviga, pied_piper, 5_000_000.0)
nip_alert_round_one = FundingRound.new("incubator", erlich_bachman, nip_alert, 10_000.0)
pied_piper_round_three = FundingRound.new("Series B", raviga, pied_piper, 10_000_000)


binding.pry
