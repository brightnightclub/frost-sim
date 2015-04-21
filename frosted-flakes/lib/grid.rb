require_relative 'neighborhood'

class Grid
  attr_reader(:odds, :evens)

  ODDS_ARRAY = [[[0, 0], [0,1],[1, 0],[1, 1]],
              [[0, 2], [0,3],[1, 2],[1, 3]],
              [[2, 0], [3,0],[2, 1],[3, 1]],
              [[2, 2], [2,3],[3, 2],[3, 3]]]

  EVENS_ARRAY = [[[0, 0], [0,3],[3, 0],[3, 3]],
              [[1, 1], [2,1],[1, 2],[2, 2]],
              [[0, 1], [3,1],[0, 2],[3, 2]],
              [[1, 0], [2,0],[3, 1],[3, 2]]]

  def initialize
    @odds = find_odds
    @evens = find_evens
  end

  def find_odds
    output = []
    ODDS_ARRAY.each do |array|
      output << Neighborhood.new(array)
    end
    return output
  end

  def find_evens
    output = []
    EVENS_ARRAY.each do |array|
      output << Neighborhood.new(array)
    end
  end
end
