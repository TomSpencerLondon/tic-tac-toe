require 'rules'
require 'board'


describe Rules do
  subject(:rules) { described_class.new(Board.new) }

  describe 'can identify result of a game' do
    it 'can identify if there is a winner' do
      expect(rules.got_winner?(:X)).to eq(false)
    end

    it 'can identify if there is a tie' do
      expect(rules.got_tie?).to eq(false)
    end
  end
end
