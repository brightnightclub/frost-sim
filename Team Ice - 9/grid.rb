class Grid
  def initialize(x,y)
    @length, @width = x, y

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

  def update_neighborhood

  end

  def update_board
    @arena.each_with_index do |row, row_num|
      if row_num.odd? then next end
      row.each_with_index do |col, col_num|
        if col_num.odd? then next end

        coords = find_neighborhood(row_num, col_num)
        if icy?(coords)
          update_neighborhood(coords)
        end
      end
    end
  end

  def icy?(coords)

    vals = coords.map do |coord|
      x, y = coord
      @arena[x][y]
    end
    puts vals
    vals.include?('*')
  end

  def find_neighborhood(y,x)
      [[x,y], [x, y+1], [x+1, y], [x+1, y+1]]
  end

  def iterate_thru_arena

  end

end

g = Grid.new(20,80)
coords =  g.find_neighborhood(0,0)
g.icy?(coords)
g.show
