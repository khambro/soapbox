require_relative 'bubble'

array_o_bubbles = []

#answer = "Y"
#puts "Would you like to post? (Y/N)"
#answer = gets.chomp.upcase

puts "Username?"
username = gets.chomp.downcase

answer = "Y"
while answer == "Y"
  puts "What's on your mind #{username}?"
  body = gets.chomp
  puts "-" * 50

  hash_o_attrs = {
    username: username,
    body: body,
    created_at: Time.now}

  bubs = Bubble.new(hash_o_attrs)

  puts bubs.formatted_string
  puts "-" * 50

  puts "Would you like to post again #{username} ? (Y/N)"
  answer = gets.chomp.upcase

  array_o_bubbles << bubs

end

puts "Goodbye #{username}!"

puts "All of #{username}'s posts:"
puts "-" * 50
array_o_bubbles.each do |bubble|
  puts bubble.formatted_string
  puts "-" * 50
end
