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
  1. Get all recent bill numbers
  2. Search bills by subject matter"
  userimport = gets.chomp
  if userimport == "1"
    userbillsorttype = "introduced"
    

  elsif userimport == "2"
    puts "Please enter the subject matter you're interested in."
    billsubjectmatter = gets.chomp
    # user.bill.find_bill_by_subject(billsubjectmatter)
  else
    puts "Please enter a proper command."
    inquiry(user)
  end



end
