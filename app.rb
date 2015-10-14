require_relative 'bubble'


puts "Username?"

username = gets.chomp.downcase

puts "What's on your mind #{username}?"

body = gets.chomp

hash_o_attrs = {username: username, body: body, created_at: Time.now}


b = Bubble.new(hash_o_attrs)

puts b.username
puts b.body
puts b.created_at












#Create a seperate file called app.rb. Use require_relative 'bubble' at the top of the file to include the code from your bubble class (this is no different than having the code written in this spot). When the script is run from the terminal with ruby app.rb, it will:

#Ask for a username
#Ask for the body of a Bubble
#Create a Bubble instance using that information (with created_at being Time.now)
#Add the bubble instance to an Array
#Print out the details of each bubble.
#Start over at step 2.
