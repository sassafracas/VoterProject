def welcome
  puts "Hey, partner. What's your name?"
  username = gets.chomp
  user = User.find_or_create_by(name: username)
  inquiry(user)
end

def inquiry(user)
  puts "1. Get all recent bills"
  userimport = gets.chomp
  if userimport == "1"
    userbilltype = "introduced"
    user.recent_bills(userbilltype)
  end

end
