require_relative "menu.rb"

def printMenu choice
  print "***#{@menu.keys[choice].to_s.capitalize}***\n\n"
  @menu.values[choice].each do | type, item |
    print "#{type.to_s.gsub('_',' ')}:\n"
    item.each do |item, item_info |
      print "#{item.to_s.capitalize}\n"
      description = item_info[:description]
      print " #{description}\n"
      price = item_info[:price]
      print " Price: $%0.2f\n" %price
      print "\n"
    end
  end
end

def getInput prompt, good_input
  good_input = good_input.map{|i| i.to_s}
  print prompt
  outp = gets.chomp
  bad = !good_input.include?(outp)
  if bad
    while bad
      print "Try again. #{prompt}"
      outp = gets.chomp
      bad = false if good_input.include?(outp)
    end
  end
  outp
end

def chooseMenu
  prompt = "Choose a menu to print: 1.Breakfast 2.Lunch 3.Dinner 4.Appitzer(enter a number): "
  good_input = (1..@menu.keys.length).to_a
  choice = ( getInput(prompt, good_input).to_i - 1 )
  printMenu choice
end

# chooseMenu
