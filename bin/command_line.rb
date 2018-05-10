#Welcomes the user, gets their name, makes their name a username, then finds it or creates it. Then inquires what the user wants to do using the inquiry method.
def welcome
  puts "Hey, partner. What's your name?"
  username = gets.chomp
  user = User.find_or_create_by(name: username)
  inquiry(user)
end

#Inquires what the user wants to do. So far it can only ask if the user wants the recent bills introduced.
def inquiry(user)
  puts "Please put in the number of the option you desire:
  1. Get the recent most bill introduced
  2. Search bills by subject matter"
  userimport = gets.chomp
  if userimport == "1"
    userbillsorttype = "introduced"
    #This gets the most recentbill object and shows it to the user
    most_recent_bills(userbillsorttype)
    puts "Would you like to save this bill? Please enter 'yes' or 'no'."
      response = gets.chomp
      if response == "yes"
      user.bills << most_recent_bills(userbillsorttype)
      puts user.bills.first.name
      elsif response == "no"
        inquiry(user)
      end

  elsif userimport == "2"
    puts "Please enter the subject matter you're interested in."
    billsubjectmatter = gets.chomp
    find_bill_by_subject(billsubjectmatter)
    puts "Would you like to save this bill? Please enter 'yes' or 'no'."
      response = gets.chomp
      if response == "yes"
      user.bills << find_bill_by_subject(billsubjectmatter)
      puts user.bills.first.name
      elsif response == "no"
        inquiry(user)
      end
  else
    puts "Please enter a proper command."
    inquiry(user)
  end



end
