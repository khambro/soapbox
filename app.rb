require_relative 'bubble'

#username = ''
#body = ''
#while username != 'exit' && body != 'exit'

array_o_bubbles = []

puts "Would you like to post? (Y/N)"
answer = gets.chomp.upcase
while answer == "Y"
  puts "Username?"
  username = gets.chomp.downcase
  puts "What's on your mind #{username}?"
  body = gets.chomp
  puts "#{username} says #{body}."
  puts "Would you like to post? (Y/N)"
  answer = gets.chomp.upcase
  #if answer == "Y"
    #puts "Username?"
    #answer = gets.chomp
  #else
  hash_o_attrs = {username: username, body: body, created_at: Time.now}



  b = Bubble.new(hash_o_attrs)

  array_o_bubbles << (b)


end



puts "Goodbye!"



puts array_o_bubbles.inspect




#end
#array_o_bubbles.each do |elements|
#  puts elements[:username]
#end
#
#  puts elements[:body]
#  puts elements[:created_at]
#end















#Ask for a username
#Ask for the body of a Bubble
#Create a Bubble instance using that information (with created_at being Time.now)
#Add the bubble instance to an Array
#Print out the details of each bubble.
#Start over at step 2.
