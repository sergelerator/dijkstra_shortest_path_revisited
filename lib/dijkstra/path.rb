# Path class to represent the way that links two nodes
#
class Dijkstra::Path
  attr_reader :left_end, :right_end, :distance

  def initialize(left_end, right_end, distance)
    @left_end   = left_end
    @right_end  = right_end
    @distance   = distance
  end
end
