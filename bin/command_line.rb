#Welcomes the user, gets their name, makes their name a username, then finds it or creates it. Then inquires what the user wants to do using the inquiry method.
def welcome
  puts "Hey, partner. What's your name?"
  username = gets.chomp
  user = User.find_or_create_by(name: username)
  inquiry(user)
end

#Inquires what the user wants to do. Calls the appropriate method for each option.
def inquiry(user)
  puts "Please put in the number of the option you desire:
  1. Get the recent most bill introduced into the House.
  1a. Description Test (Simple API Pull)
  1b. Most Popular Bill Test
  1c. Find Bill By Name Test (DB Find)
  1d. Check Status Of Bill
  2. Search bills by subject matter.
  3. Show all my bills.
  4. Quit."
  userimport = gets.chomp
  case userimport
  when "1"
    get_most_recent_bill(user)
  when "1a"
    bill_slug = "hr5710"
    bill_descriptions(bill_slug) #works
  when "1b"
    puts Bill.most_popular_bill.name #works
  when "1c"
    bill_slug = "hr5718"
    puts Bill.find_bill_by_name(bill_slug).name #works
  when "1d"
    puts "Please enter the name of the bill you would like to know the status of"
    bill_slug = gets.chomp
    bill_name = Bill.find_bill_by_name(bill_slug).name
    find_status_of_my_bill(bill_name) #works
  when "2"
    search_bill_by_subject(user)
  when "3"
    show_all_bills(user)
  when "4"
    exit
  end
end

#Starts the enquiry method again.
def go_back_to_start(user)
  inquiry(user)
end

#Shows all the saved bills for the user.
def show_all_bills(user)
  user.bills.each do |bill|
    puts bill.name
  end
  go_back_to_start(user)
end

#Searches propublica for a bill by the subject matter the user gives. Asks whehter to save that subject matter as the user's interest, and asks whether to save that bill to the user's bill collection.
def search_bill_by_subject(user)
  puts "Please enter the subject matter you're interested in."
  billsubjectmatter = gets.chomp
  puts "Would you like to make this your interest?"
  interest_response = gets.chomp
  if interest_response == "yes"
    user.interest = billsubjectmatter
    find_bill_by_subject(billsubjectmatter)
    puts "Would you like to save this bill? Please enter 'yes' or 'no'."
    response = gets.chomp
    if response == "yes"
      user.bills << find_bill_by_subject(billsubjectmatter)
      puts user.bills.first.name
    else
      go_back_to_start(user)
    end
  else
    find_bill_by_subject(billsubjectmatter)
    puts "Would you like to save this bill? Please enter 'yes' or 'no'."
    response = gets.chomp
    if response == "yes"
      user.bills << find_bill_by_subject(billsubjectmatter)
      puts user.bills.first.name
    else
      go_back_to_start(user)
    end
  end
end

#Searches propublica for the recent most bill introduced to the house. Asks whether to save the bill to the user's bill collection.
def get_most_recent_bill(user)
  userbillsorttype = "introduced"
  most_recent_bills(userbillsorttype)
  puts most_recent_bills(userbillsorttype).name
  puts "Would you like to save this bill? Please enter 'yes' or 'no'."
  response = gets.chomp
  if response == "yes"
    user.bills << most_recent_bills(userbillsorttype)
    puts user.bills.first.name
  else
    go_back_to_start(user)
  end
end
