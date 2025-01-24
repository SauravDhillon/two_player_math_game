require_relative 'player'
require_relative 'turn'

class Game 
  def initialize
    @player1 = Player.new("Player 1")
    puts "Player 1 initialized: #{@player1.inspect}"

    @player2 = Player.new("Player 2")
    puts "Player 2 initialized: #{@player2.inspect}"
    
    @current_player = @player1
  end

  def play 
    while @player1.alive? && @player2.alive?
      puts "---------NEW TURN -------"
      turn = Turn.new(@current_player)
      turn.play
      display_scores
      switch_player
  end
  end_game
end 

private

def switch_player
  @current_player = @current_player == @player1 ? @player2 : @player1
end

def display_scores
  puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
end

def end_game
  winner = @player1.alive? ? @player1 : @player2
  puts "#{winner.name} wins with a score of #{winner.lives}/3"
  puts "----- GAME OVER -----"
  puts "Good bye!"
end
end 