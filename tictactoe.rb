# set up game play loop
# create a grid
# assign values to those grids
# assign X to user, O to computer
# user picks a square
# computer picks an empty square
# this repeats until there is a logical win
# push user input into array



            
#winning_combos = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,6], [3,6,9], [1,5,9], [7,5,3]]




def reference_board
  my_str = <<-art

 1 | 2 | 3
---+---+---
 4 | 5 | 6
---+---+---
 7 | 8 | 9   
                          
  art
  puts my_str
end

def board
  my_str = <<-art

     |     |     
     |     |     
     |     |     
-----+-----+-----
     |     |     
     |     |     
     |     |     
-----+-----+-----
     |     |     
     |     |     
     |     |     
                          
  art
  puts my_str
end

# Play the game
play_again = "Y"
def play_game
  puts "Try to connect 3 squares in a row or diagonal."
  puts "Your marks will be represented with X and mine will be O."
  puts
  available_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  puts "You go first."
  user_squares = [] 
  computer_squares = []
  3.times do
    reference_board
    puts "Available Squares: #{available_squares}" 
    puts "Which square do you choose?"
    user_input = gets.chomp.to_i
    user_squares << user_input
    available_squares.delete(user_input)
    puts
    computer_choice = available_squares.sample
    puts "Okay, my turn. I choose #{computer_choice}"
    computer_squares << computer_choice
    available_squares.delete(computer_choice)
  end#do

  winning_combos = [123, 456, 789, 147, 256, 369, 159, 357]
  if winning_combos.include?(user_squares.sort.join.to_i)
    puts "You Win!"
  elsif winning_combos.include?(computer_squares.sort.join.to_i)
    puts "I Win!"
  else 
    puts "It's a draw."
  end#if

end#play_game

play_game
puts "Want to play again?  Y / N"
play_again = gets.chomp


# Ask if the user want to play again
while play_again.upcase.include?("Y")
  play_game
  puts "Want to play again?  Y / N"
  play_again = gets.chomp
end
puts "Okay Goodbye."

