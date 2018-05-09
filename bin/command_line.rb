def welcome
  puts "Hey, partner. What's your name?"
  username = gets.chomp
  username = User.find_or_create_by(name: username)
end
