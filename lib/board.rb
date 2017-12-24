class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  def print_board
    puts '__ __ __'
    @grid.each do |row|
      puts row.map { |cell| cell == " " ? "-" : cell }.join(" |")
      puts '__ __ __'
    end
  end

end
