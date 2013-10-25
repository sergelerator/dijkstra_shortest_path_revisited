# Node class to represent Graph's interest points, also called 'Vertex'
#
class Dijkstra::Node
  attr_accessor :distance_label, :path
  attr_reader   :previous_node

  def initialize
    @distance_label = Dijkstra::Infinity
  end

  def measure_neighbours_distance
    neighbours.each do |node|
      node.set_distance_label(self, distance_label + node.path.distance)
    end
  end

  def neighbours
    paths.map do |p|
      n = p.left_end == self ? p.right_end : p.left_end
      n.path = p
      n
    end
  end

  def paths
    @paths ||= []
  end

  def reset_distance_label
    @distance_label = Dijkstra::Infinity
  end

  def set_distance_label(visitor, distance_to_this_node)
    if distance_to_this_node < distance_label
      @distance_label = distance_to_this_node
      @previous_node = visitor
    end
  end
end
