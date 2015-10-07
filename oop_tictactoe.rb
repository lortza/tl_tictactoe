# 1. Come up with requirements/specifications, which will determine the scope.
# 2. Application logic; sequence of steps
# 3. Translation of those steps into code
# 4. Run code to verify logic.
#
# assign player to "X"
# assign computer to "O"
#
# loop until a winner or all squares are taken
#   player picks an empty square
#   check for a winner
#   computer picks an empty square
#   check for a winner
#
# if there's a winner,
#   show the winner
# or else
#   it's a tie

module Reference
  def ref_board
    system 'clear'
    board = <<-art
    1 | 2 | 3
   ---+---+---
    4 | 5 | 6
   ---+---+---
    7 | 8 | 9   

    art
    puts board
  end #draw_ref_board
end #Reference

class Board
  WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def initialize
    @data = {}
    (1..9).each {|position| @data[position] = Square.new(" ")}
  end #initialize

  def draw
    board = <<-art
     |     |
  #{@data[1]}  |  #{@data[2]}  |  #{@data[3]}
     |     |
-----+-----+-----
     |     |
  #{@data[4]}  |  #{@data[5]}  |  #{@data[6]}
     |     |
-----+-----+-----
     |     |
  #{@data[7]}  |  #{@data[8]}  |  #{@data[9]}
     |     |

    art
    puts board
    puts
  end #draw

  def empty_squares
    @data.select {|_, sq| sq.empty?}.values
  end #empty_squares

  def empty_positions
    @data.select {|_, sq| sq.empty?}.keys
  end #empty positions

  def all_squares_marked?
    empty_squares.size == 0
  end #all_squares_marked

  def mark_square(position, marker)
    @data[position].mark(marker)
  end #mark_square

  def three_squares_in_a_row?(marker)
    WINNING_LINES.each do |line|
      return true if @data[line[0]].value == marker && @data[line[1]].value  == marker && @data[line[2]].value == marker
    end
    false
  end
end #Board


class Square
  attr_accessor :value

  def initialize(v)
    @value = v
  end# initialize

  def mark(marker)
    @value = marker
  end #mark

  def occupied?
    @value != " "
  end #occupied!

  def empty?
    @value == " "
  end #empty!

  def to_s
    @value
  end #to_s
end #Square


class Player
  attr_accessor :marker, :name

  def initialize(name, marker)
    @name = name
    @marker = marker
  end #initialize
end #Player


class Game
  include Reference

  def initialize
    @board = Board.new
    @player = Player.new("PlayerName", "X")
    @computer = Player.new("The Computer", "O")
    @current_player = @player
  end #initialize

  def current_player_marks_square
    if @current_player == @player
      begin
        puts "Choose a position #{@board.empty_positions} to place your mark:"
        position = gets.chomp.to_i
      end until @board.empty_positions.include?(position)
    else
      position = @board.empty_positions.sample
    end #if
    @board.mark_square(position, @current_player.marker)
  end #current_player_marks_square

  def play
    ref_board
    @board.draw
    loop do
      current_player_marks_square
      ref_board
      @board.draw
      if current_player_wins?
        puts "#{@current_player.name} is the winner!"
        break
      elsif @board.all_squares_marked?
        puts "Ruh roh. The board is full and nobody won. It's a tie."
        break
      else
        alternate_player
      end #if
    end #loop
    
  end #play

  def alternate_player
    if @current_player == @player
      @current_player = @computer
    else
      @current_player = @player
    end #if
  end #alternate_player

  def current_player_wins?
    @board.three_squares_in_a_row?(@current_player.marker)
  end #current_player_wins?

end #Game


# =========== GAME PLAY LOOP ==================
play_choice = "Y"
puts "Welcome to Tic Tac Toe."
Game.new.play

puts "Want to play again? Y | N"
play_choice = gets.chomp.upcase

while play_choice.include? "Y"
  Game.new.play
  puts "Want to play again? Y | N"
  play_choice = gets.chomp.upcase
end
puts "Bye! See you next time."
