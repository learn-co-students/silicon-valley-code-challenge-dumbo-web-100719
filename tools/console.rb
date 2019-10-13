require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
google = Startup.new("google", "nic", "internet") 
facebook = Startup.new("facebook", "bri", "internet")
jesus = VentureCapitalist.new("jesus", 3000000000)
marx = VentureCapitalist.new("marx", 500)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line