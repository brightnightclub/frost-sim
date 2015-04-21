class Board

  attr_reader :height, :width

  def self.generate(half_height, half_width)
    height = half_height * 2
    width = half_width * 2

    board = height.times.map do |row|
      width.times.map{ [' ', '.'].sample }
    end

    board[half_height][half_width] = "*"

    return new(board)

  end

  def initialize(board)
    @width = board.first.length
    @height = board.length
    @board = board
  end

  def to_str
    @board.map{ |row| row.join }.join("\n")
  end

  # A neighborhood is always a square of four cells.
  def neighborhoods

  end


  # def tick
  #   Board.new neighborhoods.each{...}
  # end

end

class Neighborhood
  attr_reader :points

  def self.generate(board)
    n_sets = []
    points = []
    board.height.times do |row|
      board.width.times do |col|
        points.push([row, col])
      end
      if row % 2 != 0
        n_sets << new(points[0], points[1], points[2], points[3])
        points = []
      end
    end
    puts n_sets.inspect
    return n_sets
  end

  def initialize(p1, p2, p3, p4)
    @points = [p1, p2, p3, p4]
  end

  def ==(other)
    @points == other.points
  end
end

class Cell
end
