# creates a hash with all of the board positions
def initialize_board
  b = {}
  (1..9).each {|position| b[position] = position}
  b
end

def draw_board(b)
  puts " #{b[1]} | #{b[2]} | #{b[3]}"
  puts "---+---+---"
  puts " #{b[4]} | #{b[5]} | #{b[6]}"
  puts "---+---+---"
  puts " #{b[7]} | #{b[8]} | #{b[9]} "                    
end#def

draw_board