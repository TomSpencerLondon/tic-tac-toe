require 'board'

describe Board do
  subject(:board) { described_class.new }

  describe '3x3 grid' do
    it 'creates grid - array of three arrays representing rows' do
      expect(board.grid.length).to eq 3
    end

    it 'creates grid - each sub-array has three columns' do
      expect(board.grid[0].length).to eq 3
      expect(board.grid[1].length).to eq 3
      expect(board.grid[2].length).to eq 3
    end
  end


  describe '#set_value' do
    it 'can set value of grid' do
      board.set_value(1, 1, :X)
      expect(board.grid[1][1]).to eq :X
    end
  end
end
