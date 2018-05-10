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
  2. Search bills by subject matter
  3. Show all my bills
  4. Quit"
  userimport = gets.chomp
    if userimport == "1"
      get_most_recent_bill(user)
    elsif userimport == "2"
      search_bill_by_subject(user)
    elsif userimport == "3"
      show_all_bills(user)
    elsif userimport == "4"
      exit
    end
  end



def go_back_to_start(user)
  inquiry(user)
end

def show_all_bills(user)
  user.bills.each do |bill|
    puts bill.name
  end
  go_back_to_start(user)
end

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

def get_most_recent_bill(user)
  userbillsorttype = "introduced"
  #This gets the most recentbill object and shows it to the user
  most_recent_bills(userbillsorttype)
  puts "Would you like to save this bill? Please enter 'yes' or 'no'."
  response = gets.chomp
  if response == "yes"
    user.bills << most_recent_bills(userbillsorttype)
    puts user.bills.first.name
  else
    go_back_to_start(user)
  end
end
