class Question 
  attr_reader :text, :answer

  def initialize
    num1 = rand(1..20)  # generate random number between 1 and 20
    num2 = rand(1..20)
    @text = "What does #{num1} plus #{num2} equal?"
    @answer = num1 + num2
  end

  # method to compare if player_answer is correct will return true if correct
  def correct?(player_answer)
    player_answer.to_i == @answer
  end

end