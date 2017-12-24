class Printer

  def start_game_message
    puts 'Welcome to Tic Tac Toe'
    game_board_diagram
  end

  def game_board_diagram
    puts '|1|2|3|'
    puts '|4|5|6|'
    puts '|7|8|9|'
  end

  def game_ends_with_win_message(player)
    puts "Game is over. #{player} has won."
  end

  def game_ends_with_tie message
    puts "Game is over.It was a tie."
  end

  def get_move_message(player)
    puts "It is #{player}'s turn now"
    puts "Where do you want to move? <1-9>: "
  end

  def invalid_move_message
    puts "That move was not valid."
    puts "The position is taken"
    puts "Pick another move: "
  end
end
