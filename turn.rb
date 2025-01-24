class Turn 
 
  def initialize(player)
    @player = player   # to keep track of current player
    @question = Question.new # we initialize new question object here when player turn comes
  end

  def play 
    # here we get value of text from question class using attr_reader
    puts "#{@player.name}: #{@question.text}" 
    print "> "
    answer = gets.chomp  # we grab player input

    # here we describe if else using Question class correct method
    # also we used player class lose_life method to decrease player life
    if @question.correct?(answer)
      puts "#{@player.name}: YES! You are correct."
    else
      puts "#{@player.name}: Seriously? No!"
      @player.lose_life
    end
  end
end