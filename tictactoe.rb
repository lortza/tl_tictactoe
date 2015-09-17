# set up game play loop
# create a grid
# assign values to those grids
# assign X to user, O to computer
# user picks a square
# computer picks an empty square
# this repeats until there is a logical win
# push user input into array

#really nice solution: http://jheg.github.io/programs/2014/09/03/tic-tac-toe-pt2/

#TODO: 1) handle invalid responses 2) refactor 3) watch video
            
#winning_combos = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,6], [3,6,9], [1,5,9], [7,5,3]]

#markers
  @pos1 = 1
  @pos2 = 2
  @pos3 = 3
  @pos4 = 4
  @pos5 = 5
  @pos6 = 6
  @pos7 = 7
  @pos8 = 8
  @pos9 = 9

def reference_board
  my_str = <<-art

 #{@pos1} | #{@pos2} | #{@pos3}
---+---+---
 #{@pos4} | #{@pos5} | #{@pos6}
---+---+---
 #{@pos7} | #{@pos8} | #{@pos9}   
                          
  art
  puts my_str
end

def assign_user_markers
  if @user_input == 1
    @pos1 = "X"
  elsif @user_input == 2
    @pos2 = "X"
  elsif @user_input == 3
    @pos3 = "X"
  elsif @user_input == 4
    @pos4 = "X"
  elsif @user_input == 5
    @pos5 = "X"
  elsif @user_input == 6
    @pos6 = "X"
  elsif @user_input == 7
    @pos7 = "X"
  elsif @user_input == 8
    @pos8 = "X"
  else
    @pos9 = "x"
  end
end#def

def assign_computer_markers
  if @computer_choice == 1
    @pos1 = "O"
  elsif @computer_choice == 2
    @pos2 = "O"
  elsif @computer_choice == 3
    @pos3 = "O"
  elsif @computer_choice == 4
    @pos4 = "O"
  elsif @computer_choice == 5
    @pos5 = "O"
  elsif @computer_choice == 6
    @pos6 = "O"
  elsif @computer_choice == 7
    @pos7 = "O"
  elsif @computer_choice == 8
    @pos8 = "O"
  else
    @pos9 = "O"
  end#if
end #def

def reset_markers
  @pos1 = 1
  @pos2 = 2
  @pos3 = 3
  @pos4 = 4
  @pos5 = 5
  @pos6 = 6
  @pos7 = 7
  @pos8 = 8
  @pos9 = 9
end#def

# Play the game
play_again = "Y"
def play_game
  reset_markers
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
    @user_input = gets.chomp.to_i
    user_squares << @user_input
    available_squares.delete(@user_input)
    puts
    assign_user_markers
    @computer_choice = available_squares.sample
    puts "Okay, my turn. I choose #{@computer_choice}"
    computer_squares << @computer_choice.to_i
    available_squares.delete(@computer_choice)
    assign_computer_markers
  end#do

  winning_combos = [123, 456, 789, 147, 256, 369, 159, 357]
  if winning_combos.include?(user_squares.sort.join.to_i)
    puts "You Win!"
  elsif winning_combos.include?(computer_squares.sort.join.to_i)
    puts "I Win!"
  else 
    puts "It's a draw."
  end#if
  reference_board

end#play_game


# Start the Game
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

