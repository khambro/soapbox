require_relative 'bubble'
require 'colorize'

array_o_bubbles = []

puts "\t\t\t\t\tWelcome to SoapBox!\t\t\t\t\t".black.on_light_green.bold

files = Dir.glob("/Users/khambro/Dropbox/SoapBox/*")

time_sorted_feed = files.sort_by {|x| File.birthtime(x)}.reverse

time_sorted_feed.each do |post|
  r= File.open(post)
  hash_o_attrs = {
    username: r.read.light_cyan.on_black,
    body: File.basename(post),
    created_at: r.birthtime
  }
  bubs = Bubble.new(hash_o_attrs)
  array_o_bubbles << bubs
end

array_o_bubbles.each do |bubble|
  puts bubble.formatted_string
  puts "-" * 50
end

  #puts r.inspect
  #puts r.class

  puts "-" * 50

answer = ''
if answer != "Exit"
  puts "Type (P) to post, (R) to refresh, and (Exit) to exit"

  answer = gets.chomp.capitalize

  while answer == "P"
    puts "Username?".black.on_light_green.bold
    username = gets.chomp.downcase
    puts "What's on your mind #{username}?".black.on_light_green.bold
    body = gets.chomp
    hash_o_attrs = {
      username: username,
      body: body,
      created_at: Time.now.strftime("%A, %d %b %Y %l:%M %p")}
    bubs = Bubble.new(hash_o_attrs)
    bubs.save_file
    puts "-".black.on_magenta.bold * 50
    puts "Type (P) to post, (R) to refresh, and (Exit) to exit"
    answer = gets.chomp.capitalize
  end

  if answer == "R"
    files = Dir.glob("/Users/khambro/Dropbox/SoapBox/*")

    files.each do |post|
      r= File.open(post)
      hash_o_attrs = {
        username: r.read.light_cyan.on_black,
        body: File.basename(post),
        created_at: r.birthtime
      }
      bubs = Bubble.new(hash_o_attrs)
      array_o_bubbles << bubs
    end

    array_o_bubbles.each do |bubble|
      puts bubble.formatted_string.sort_by_time
      puts "-" * 50
    end
  end

end


#answer = "Y"
##while answer == "Y"


  #hash_o_attrs = {
#    username: username,
#    body: body,
#    created_at: Time.now.strftime("%A, %d %b %Y %l:%M %p")}

  #bubs = Bubble.new(hash_o_attrs)

  # creating a file
  #puts bubs.body

  #bubs.save_file

  #puts bubs.formatted_string
  #puts "-" * 50

  #puts "Would you like to make a new post #{username} ? (Y/N)".black.on_light_green.bold
  #answer = gets.chomp.upcase

  #array_o_bubbles << bubs

#end

puts "Goodbye #{username}!".black.on_light_green.bold



#puts "All of #{username}'s posts:"
#puts "-" * 50
#array_o_bubbles.each do |bubble|
#  puts bubble.formatted_string
#  puts "-" * 50
#end
