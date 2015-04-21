require_relative '../lib/grid'
require 'pry'

describe Grid do

  describe '#odds_array' do
    it 'displays the grid of vacuum' do
      grid = Grid.new

      expect(grid.odds.class).to eq(Array)
      expect(grid.odds.last.points.last.position).to eq([3,3])
    end
  end

end
