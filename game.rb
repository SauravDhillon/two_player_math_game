require_relative 'player'
require_relative 'turn'

# game class is biggest class in which we initialized players 

class Game 
  def initialize
    @player1 = Player.new("Player 1")
    puts "Player 1 initialized: #{@player1.inspect}"

    @player2 = Player.new("Player 2")
    puts "Player 2 initialized: #{@player2.inspect}"
    
    @current_player = @player1
  end

  def play 
    while @player1.alive? && @player2.alive? # here we used while loop to check condition that players are alive 
      puts "---------NEW TURN -------"
      turn = Turn.new(@current_player)  # here we initialized turn object 
      turn.play                        # we called play method of turn object
      display_scores                 # here we display scores
      switch_player
  end
  end_game   # if any player is not alive we go to end_game
end 

private  # we put below methods under private so that no one change its functionality

def switch_player
  @current_player = @current_player == @player1 ? @player2 : @player1 #here we checked if current player is player 1 change it to player 2 
end

def display_scores
  puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"  # here we used get lives from attr_reader on player class
end

def end_game
  winner = @player1.alive? ? @player1 : @player2 # here we checked if player1 is alive then player1 is winner otherwise not 
  puts "#{winner.name} wins with a score of #{winner.lives}/3"
  puts "----- GAME OVER -----"
  puts "Good bye!"
end
end 