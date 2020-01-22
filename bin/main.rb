#!/usr/bin/env ruby

require '../lib/player.rb'

require '../lib/board.rb'

def instructions
  puts 'If you want to stop playing in your turn select 0'
end

def showboard(board)
  puts '╔═══╦═══╦═══╗'
  puts "║ #{board.board[0]} ║ #{board.board[1]} ║ #{board.board[2]} ║"
  puts '╠═══╬═══╬═══╣'
  puts "║ #{board.board[3]} ║ #{board.board[4]} ║ #{board.board[5]} ║"
  puts '╠═══╬═══╬═══╣'
  puts "║ #{board.board[6]} ║ #{board.board[7]} ║ #{board.board[8]} ║"
  puts '╚═══╩═══╩═══╝'
end

instructions
puts "Type player one name(The 'X')"
player_one = Player.new(gets.chomp.capitalize, 'X')
puts "Type player two name(The 'O')"
p2_name = gets.chomp.capitalize
while p2_name == player_one.name
  puts 'Your name is the same as player one, choose another'
  p2_name = gets.chomp.capitalize
end
player_two = Player.new(p2_name, 'X')
board = Board.new
puts "Hello #{player_one.name} and #{player_two.name} let's start"
puts showboard(board)
i = 0
play = true
while true
  if play
    puts "#{player_one.name}, choose a square number"
  else
    puts "#{player_two.name}, choose a square number"
  end
  choice = gets.chomp
  break unless board.move(play, choice)
  play = !play
  showboard(board)
  winner = board.winner?
  if winner
    if winner == 'X'
      puts "You're the winner #{player_one.name}"
      break
    else
      puts "You're The winner #{player_two.name}"
      break
    end
  end
  unless board.draw?
    puts "Game Draw"
    break
  end
end

puts 'Game Over, terminating'
