class Grid
  def initialize(x,y)
    @arena = []
    x.times { @arena << [] }
    @arena.each do |row|
      y.times do
        row << [" ","."].sample
      end
    end
    @arena[x/2][y/2] = '*'
  end

  def show
    @arena.each do |line|
      puts line.join ""
    end
  end

  def find_neighborhood(y,x)
  end

end

g = Grid.new(20,80)
1600.times do
  g.show
  system('clear')
end
