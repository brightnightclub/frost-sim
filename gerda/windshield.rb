require 'pry'
class Windshield
  def initialize(width, height)
    @width = width
    @height = height
    @glass = Array.new(@width){ Array.new(@height){ make_cell }}
    # @cells = @width*@height
    # @ghosts_wide = @width/2
    # @ghosts_tall = @height/2
    #inject_vapor
    @glass[@width/2][@height/2] = Cell.new("*")
  end

  def make_cell
    rand_state = [" ", "."].sample
    Cell.new(rand_state)
  end

  # def inject_vapor
  #   vapors = (@width * @height) / 2
  #   vapors.times do
  #     w = (0..@width-1).to_a.sample
  #     h = (0..@height-1).to_a.sample
  #     puts "w: #{w}. h: #{h}"
  #     cell = @glass[w][h]
  #     puts cell.state
  #     cell.state = ['.', ' '].sample
  #   end
  # end

  def print
    @glass.each do |arr|
      arr.each do |c|
        putc c.state
      end
      puts
    end
  end
end

class Tick
  def freezeSwirl

  end

  def shiftPane

  end
end

class Cell
  attr_accessor :state
  def initialize(state)
    @state = state
  end
end

puts "Give us a width that is an even number, hahahahahahaha:"
widput = gets.chomp.to_i
while widput.zero? || widput.odd?
  puts "Seriously. You don't listen well... Please, and EVEN number."
  widput = gets.chomp.to_i
end
puts "Alright, now give us an even height for your windshield:"
heightput = gets.chomp.to_i
while heightput.zero? || heightput.odd?
  puts "Smart ass.  I said an even number."
  heightput = gets.chomp.to_i
end
our_windshield = Windshield.new(widput, heightput)
our_windshield.print
