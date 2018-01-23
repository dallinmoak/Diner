require_relative "menu.rb"

def printWelcomeMessage
  puts "Wecome to the resturaunt. My name is Dallin and I will be your server today.\n"
end

def printMenu menuChoice, menuOption
  if menuChoice == "breakfast"
    if menuOption == "entree"
      list = @breakfastEntreeList
      puts "********************Breakfast Menu:********************"
    elsif menuOption == "side"
      list = @breakfastSideList
      puts "******************Breakfast Side Menu:*****************"
    end
  elsif menuChoice == "lunch" || menuChoice == "dinner"
    if menuOption == "entree"
      list = @dinnerEntreeList
      puts "*******************Lunch/Dinner Menu:******************"
    elsif menuOption == "side"
      list = @dinnerSideList
      puts "*****************Lunch/Dinner Side Menu:***************"
    end
  end
  list.each do |item , info|
    line1 = "#{item}.#{info[0]}..........$%0.2f" % info[2]
    line2 = "#{info[1]}"
    print "| %-52s |\n" % line1
    print "|   %-50s |\n" % line2
    print "|%54s|\n" % ""
  end
  puts "*******************************************************"
end

def getMenuChoice
  #return string choice
  print "Would you like to look at our breakfast, lunch, or dinner menu? "
  choice = gets.chomp.to_s.downcase
end

def printPrice orderList, menuOption
  price = 0.0
  orderList.each do |item , info|
    price += info[2]
  end
  print "that #{menuOption} order totals to $%0.2f.\n" % price
end

def getOrder menuChoice, menuOption
  if menuOption == "Entree"
    if menuChoice == "breakfast"
      list = @breakfastEntreeList
    elsif menuChoice == "lunch" || menuChoice == "dinner"
      list = @dinnerEntreeList
    end
  elsif menuOption == "Side"
    if menuChoice == "breakfast"
      list = @breakfastSideList
    elsif menuChoice == "lunch" || menuChoice == "dinner"
      list = @dinnerSideList
    end
  end
  print "What would you like from the #{menuChoice} #{menuOption} menu? "
  print "(choose number): "
  finished = false
  orders = []
  while !finished
    entreeOrder = gets.chomp.to_s
    list.each do | item, info|
      if item == :"#{entreeOrder}"
        print "#{info[0]} is a good choice. "
        order = [item, info]
        orders << order
      end
    end
    print "Would you like another #{menuOption}?(y/n) "
    answer = gets.chomp.to_s.downcase
    if answer == "n"
      break finished = true
    elsif answer == "y"
      print "what else would you like from the #{menuChoice} menu? "
    end
  end
  orderList = Hash[orders]
  printPrice orderList, menuOption
  orderList
end

def printTotalPrice totalOrder
  #returns a float of price
end

printWelcomeMessage

menuChoice = getMenuChoice

puts "Here are our #{menuChoice} entrees:"
printMenu(menuChoice, "entree")

puts "Here are our #{menuChoice} sides:"
printMenu(menuChoice, "side")

totalOrder ={}
totalOrder = totalOrder.merge(getOrder menuChoice, "Entree")
totalOrder = totalOrder.merge(getOrder menuChoice, "Side")

printTotalPrice totalOrder
