require_relative "diner.rb"

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
