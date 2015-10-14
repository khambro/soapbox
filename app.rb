require_relative 'bubble'

array_o_bubbles = []


answer = "Y"
puts "Would you like to post? (Y/N)"
answer = gets.chomp.upcase

while answer == "Y"
  puts "Username?"
  username = gets.chomp.downcase
  puts "What's on your mind #{username}?"
  body = gets.chomp

  hash_o_attrs = {username: username, body: body, created_at: Time.now}

  bubs = Bubble.new(hash_o_attrs)

  puts bubs.formatted_string

  puts "Would you like to post? (Y/N)"
  answer = gets.chomp.upcase

  array_o_bubbles << bubs

end

puts "Goodbye!"

# to see entire array of postings
array_o_bubbles.each do |bubble|
  puts bubble.formatted_string
end
