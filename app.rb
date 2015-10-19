require_relative 'bubble'
require 'colorize'

array_o_bubbles = []

puts "\t\t\t\t\tWelcome to SoapBox!\t\t\t\t\t".black.on_light_green.bold

username = File.read("/Users/khambro/CodeBuilders/SoapBox/user")

  if username == ""
    puts "Username?".black.on_light_green.bold
    username = gets.chomp.downcase
    user = File.open("/Users/khambro/CodeBuilders/SoapBox/user", "w")
    user.write username
    user.close
    puts "Welcome #{username}!"
  else
    puts "Welcome back #{username}!"
  end

puts "To sign in as a different user, hit X. Press ENTER to continue as #{username}."
x= gets.chomp
    if x.downcase == "x"
      puts "Username?".black.on_light_green.bold
      username = gets.chomp.downcase
      user = File.open("/Users/khambro/CodeBuilders/SoapBox/user", "w")
      user.write username
      user.close
      puts "Welcome #{username}!"
    end


files = Dir.glob("/Users/khambro/Dropbox/SoapBox/*")

time_sorted_feed = files.sort_by {|x| File.birthtime(x)}

time_sorted_feed.each do |post|
  r= File.open(post)
  hash_o_attrs = {
    username: r.read.light_cyan.on_black,
    body: File.basename(post).light_magenta,
    created_at: r.birthtime
  }
  bubs = Bubble.new(hash_o_attrs)
  array_o_bubbles << bubs
end

array_o_bubbles.last(10).each do |bubble|
  puts bubble.formatted_string
  puts "-" * 50
end

  puts "-" * 50

answer = ''
while answer != "Exit"
  puts "Type (P) to post, (R) to refresh, and (Exit) to exit"

  answer = gets.chomp.capitalize

  if answer == "P"
    puts "What's on your mind #{username}?".black.on_light_green.bold
    body = gets.chomp
    hash_o_attrs = {
      username: username,
      body: body,
    }
    bubs = Bubble.new(hash_o_attrs)
    bubs.save_file
    puts "-".black.on_magenta.bold * 50
    #puts "Type (P) to post, (R) to refresh, and (Exit) to exit"
    #answer = gets.chomp.capitalize
  end

  if answer == "R"
    files = Dir.glob("/Users/khambro/Dropbox/SoapBox/*")
    time_sorted_feed = files.sort_by {|x| File.birthtime(x)}

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

    array_o_bubbles.last(10).each do |bubble|
      puts bubble.formatted_string
      puts "-" * 50
    end
  end

  puts "To sign in as a different user, hit X. Press ENTER to continue as #{username}."
  x= gets.chomp
      if x.downcase == "x"
        puts "Username?".black.on_light_green.bold
        username = gets.chomp.downcase
        user = File.open("/Users/khambro/CodeBuilders/SoapBox/user", "w")
        user.write username
        user.close
        puts "Welcome #{username}!"
      end

end


puts "Goodbye #{username}!".black.on_light_green.bold



#puts "All of #{username}'s posts:"
#puts "-" * 50
#array_o_bubbles.each do |bubble|
#  puts bubble.formatted_string
#  puts "-" * 50
#end
