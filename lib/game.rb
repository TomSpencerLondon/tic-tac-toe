require_relative 'board'

class Game

  attr_reader :board

  def initialize(board = Board, rules = Rules, printer = Printer)
    @board = board.new
    @rules = rules.new(@board)
    @print = printer.new
    @marker = :X
  end

  def get_player_move(move = gets.chomp)
    raise "Not a valid move" unless valid_move?(move)
    play(move)
  end

  private

  def play(move)
    update_board(move)
  end

  def valid_move?(move)
    x, y = convert_move_to_coordinate(move)
    @board.check_value(x, y) == :empty
  end

  def update_board(move)
    x, y = convert_move_to_coordinate(move)
    @board.set_value(x, y, @marker)
  end


  def convert_move_to_coordinate(move)
    coordinate_mapping = {
        "1" => [0, 0],
        "2" => [1, 0],
        "3" => [2, 0],
        "4" => [0, 1],
        "5" => [1, 1],
        "6" => [2, 1],
        "7" => [0, 2],
        "8" => [1, 2],
        "9" => [2, 2]
      }
      coordinate_mapping[move]
  end

end
