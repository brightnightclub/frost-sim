require_relative 'point'

class Neighborhood
  attr_reader(:points)

  def initialize(points)
    @points = points_init(points)
  end

  def points_init(points)
    output = []
    points.each do |position|
      output << Point.new(position)
    end
    return output
  end
end
