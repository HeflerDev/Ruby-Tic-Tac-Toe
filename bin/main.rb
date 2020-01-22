#!/usr/bin/env ruby

puts "Type player one name(The 'X')"
player_one_name = gets.chomp

puts "Type player two name(The 'O')"
player_two_name = gets.chomp

puts 'Validating names'

puts '╔═══╦═══╦═══╗'
puts '║ 1 ║ 2 ║ 3 ║'
puts '╠═══╬═══╬═══╣'
puts '║ 4 ║ 5 ║ 6 ║'
puts '╠═══╬═══╬═══╣'
puts '║ 7 ║ 8 ║ 9 ║'
puts '╚═══╩═══╩═══╝'

i = 0
play = true
winner = false
draw = false

while i < 9
  if play
    puts "#{player_one_name}, choose a square number"
  else
    puts "#{player_two_name}, choose a square number"
  end
  choice = gets.chomp
  puts "Validating #{choice}"
  i += 1
  play = !play
  puts 'The move is displayed on the board'

  if winner
    puts "#{player_one_name} is the winner!"
    break
  end
  if winner
    puts "#{player_two_name} is the winner!"
    break
  end
  if draw
    puts 'Draw, nobody wins'
    break
  end
end
puts 'Game Over, terminating'
