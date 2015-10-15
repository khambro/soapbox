require_relative 'bubble'
require 'colorize'

array_o_bubbles = []

#answer = "Y"
#puts "Would you like to post? (Y/N)"
#answer = gets.chomp.upcase
puts "Welcome to SoapBox!".black.on_magenta.bold
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
    created_at: Time.now.strftime("%A, %d %b %Y %l:%M %p")}

  bubs = Bubble.new(hash_o_attrs)

  # creating a file
  #puts bubs.body

  bubs.save_file

  #puts bubs.formatted_string
  #puts "-" * 50

  puts "Would you like to make a new post #{username} ? (Y/N)"
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
