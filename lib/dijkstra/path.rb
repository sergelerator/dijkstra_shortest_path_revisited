# Path class to represent the way that links two nodes
#
class Dijkstra::Path
  def initialize(node_a, node_b, distance)
    @node_a   = node_a
    @node_b   = node_b
    @distance = distance
  end

end
