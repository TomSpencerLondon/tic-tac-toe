require_relative 'board'
require_relative 'rules'
require_relative 'printer'

class Game

  attr_reader :board

  def initialize(board = Board, rules = Rules, printer = Printer)
    @board = board.new
    @rules = rules.new(@board)
    @print = printer.new
    @marker = :X
  end

  def start
    @print.start_game_message
    @print.get_move_message(@marker)
    get_player_move
  end

  def get_player_move(move = gets.chomp)
    raise "Not a valid move" unless valid_move?(move)
    play(move)
  end

  private

  def play(move)
    update_board(move)
    update_game(@marker)
  end

  def valid_move?(move)
    x, y = convert_move_to_coordinate(move)
    @board.check_value(x, y) == :empty
  end

  def invalidate_move
    @print.invalid_move_message
    get_player_move
  end

  def switch_player
    @marker == :X ? @marker = :O : @marker = :X
    @print.get_move_message(@marker)
  end

  def update_board(move)
    x, y = convert_move_to_coordinate(move)
    @board.set_value(x, y, @marker)
  end

  def update_game(last_player)
    if game_over?(last_player)
      @board.print_board
      declare_result
    else
      @board.print_board
      switch_player
      get_player_move
    end
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

  def game_over?(marker)
    return :win if @rules.got_winner?(marker)
    return :draw if @rules.got_tie?
    false
  end

  def declare_result
    if game_over?(@marker) == :win
      @print.game_ends_with_win_message(@marker)
    else
      @print.game_ends_with_tie_message
    end
  end


end
