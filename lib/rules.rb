class Rules

  def initialize(game_board)
    @game_board = game_board
  end

  def got_winner?(marker)
    winning_positions.each do |position|
      return true if position == [marker, marker, marker]
    end
    false
  end

  def got_tie?
    @game_board.grid.flatten.all? { |position| position != ' ' }
  end

  private

  def winning_positions
    horizontal_winning_positions + vertical_winning_positions + diagonal_winning_positions
  end

  def horizontal_winning_positions
    @game_board.grid.map { |row| row[0..2] }
  end

  def vertical_winning_positions
    @game_board.grid.transpose.map { |column| column[0..2] }
  end

  def diagonal_winning_positions
    [
      [@game_board.grid[0][0], @game_board.grid[1][1], @game_board.grid[2][2]],
      [@game_board.grid[0][2], @game_board.grid[1][1], @game_board.grid[2][0]]
    ]
  end


end
