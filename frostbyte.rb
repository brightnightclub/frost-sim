class FrostByte
  STARTING_VAPOR_PERCENTAGE = 50
  
  attr_reader :size
  
  def initialize(size)
    raise 'you suck!!!!!!' unless size % 2 == 0
    @size = size
    @grid = Array.new(size) do 
      Array.new(size) { Cell.new }
    end
    
    seed
    on_screen
  end
  
  def seed 
    # get the first row of the grid
    # iterate over each cell in the row
    # 50% of time change cell to vapor
    randomizer = Array.new(100).fill(true, 0 ,50)
    @grid.each do |row|
      row.each do |cell|
        cell.mist if randomizer.sample
      end
    end
    
    @grid[self.size/2][(self.size/2)-1].state = :ice
  end
  
  def tick
    neighborhoods.each do |neighborhood|
      neighborhood.map(&:freeze)
    end
  end
  
  def neighborhoods
    result = []
    
    y = 0
    while y < self.size - 2
      x = 0
      
      while x < self.size - 2
        result << [@grid[x][y], @grid[x+1][y], @grid[y+1][x], @grid[x+1][y+1]]
        x += 2
      end
      
      y += 2
    end
    
    result
  end
  
  def on_screen 
    puts @grid.map { |row| row.map(&:to_s).join }.join("\n")
  end
end

class Cell
  attr_accessor :state

  def initialize
    @state = :vacuum  
  end
  
  def state? test_state
    self.state == test_state
  end
  
  def to_s
    if self.state == :vacuum
      ' '
    elsif self.state == :vapor
      '.'
    else
      '*'
    end
  end
  
  def freeze
    self.state = :ice if self.state == :vapor
  end
  
  def mist
    self.state = :vapor
  end
end
  


f = FrostByte.new(8)
while true
  sleep 1
  f.tick
  f.on_screen
  puts '-'*f.size
end