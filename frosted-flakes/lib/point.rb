class Point
  attr_reader(:position, :state)

  def initialize(position)
    @position = position
    @state = state_rand
  end

  def state_rand
    [" ", "."].sample
  end


end
