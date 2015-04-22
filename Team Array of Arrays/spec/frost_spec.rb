require 'minitest/autorun'
require_relative '../frost'

class TestFrost < Minitest::Test

  simple_board = [
    " *",
    ". "
  ]

  def setup
    @new_board = Board.new [
      " .*  *".chars,
      "  .  .".chars,
      "** . .".chars,
      "..   *".chars
    ]
  end

  # def test_make_neighborhood
  #   new_board = Board.new [
  #     "ABCDEF".chars,
  #     "GHIJKL".chars,
  #     "MNOPQR".chars,
  #     "STUVWX".chars
  #   ]
  #   puts new_board.to_str
  #
  #   assert new_board.neighborhoods.include?("ABGH")
  # end

  def test_small_neighborhood_points
    neighborhood = Neighborhood.generate(Board.generate(1,1))
    expected = [
      Neighborhood.new([0,0], [0,1], [1,0], [1,1])
    ]

    assert_equal expected, neighborhood
  end

  def test_medium_neighborhood_points
    neighborhood = Neighborhood.generate(Board.generate(2,1))

    expected = [
      Neighborhood.new([0,0], [0,1], [1,0], [1,1]),
      Neighborhood.new([2,0], [2,1], [3,0], [3,1])
    ]

    assert_equal expected, neighborhood
  end
  #
  # def test_large_neighborhood_points
  #   neighborhood = Neighborhood.generate(Board.generate(2,2))
  #
  #   expected = [
  #     Neighborhood.new([0,0], [0,1], [1,0], [1,1]),
  #     Neighborhood.new([0,2], [0,3], [1,2], [1,3]),
  #     Neighborhood.new([2,0], [2,1], [3,0], [3,1]),
  #     Neighborhood.new([2,2], [2,3], [3,2], [3,3])
  #   ]
  #
  #   assert_equal expected, neighborhood
  # end
end
