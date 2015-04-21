require './lib/grid.rb'

100.times do
  grid = Grid.new
  grid.odds.each do |neighborhood|
    output = ""
    neighborhood.points.each do |point|
      output.concat(point.state)
    end
  puts(output)
  end
  sleep 1
  print `clear`
end
