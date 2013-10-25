# Node class to represent Graph's interest points, also called 'Vertex'
#
class Dijkstra::Node
  attr_reader :distance_label

  def initialize
    @distance_label = Dijkstra::Infinity
  end

  def paths
    @paths ||= []
  end

  def reset_distance_label
    @distance_label = nil
  end
end
