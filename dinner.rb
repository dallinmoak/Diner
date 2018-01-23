@breakfastEntreeList = {
  "1": ["Breakfast Burrito", "A burrito with eggs, sausage, potatoes.", 6.50,-1],
  "2": ["Fried Egg Plate",   "two fried eggs and some bacon",           5.45,-1],
  "3": ["Scrambled Eggs",    "two scrambled eggs and some bacon",       3.25,-1],
  "4": ["Eggs Benedict",     "Y'know, that british thing",              4.50,-1],
  "5": ["French Toast",      "Not actually french",                     7.00,-1]
}

@breakfastSideList = {
  "1": ["Toast",      "with optional butter",                       1.20,-1],
  "2": ["Oatmeal",    "a bowl of oatmeal",                          3.50,-1],
  "3": ["Boiled egg", "just a soft-boiled egg",                     1.20,-1],
  "4": ["Bacon",      "two strips of bacon",                        1.20,-1],
  "5": ["Crosaint",   "free if you can order with a french accent", 1.20,-1]
}

@dinnerEntreeList = {
  "1": ["Steak",            "made from a dead cow",                      10.20,-1],
  "2": ["Fajita Plate",     "choice of flour or corn tortilla",          18.50,-1],
  "3": ["Hamburger",        "couldn't think of anything else, so",       9.00, -1],
  "4": ["Chicken Parmesan", "fried w/ sause and stuff. yummy.",          12.20,-1],
  "5": ["Lasagna",          "with beef and mushrooms and lot of cheese", 10.50,-1]
}

@dinnerSideList = {
  "1":["Ceasar Salad", "Lettus and croutons and stuff",          3.00,-1],
  "2":["House Salad",  "Spinach and carrrots and yummy",         5.70,-1],
  "3":["Pasta salad",  "negates the health of it being a salad", 3.00,-1],
  "4":["House Soup",   "it's a suprise",                         5.00,-1],
  "5":["Fries",        "Because this is AMERICA",                6.60,-1]
}

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
