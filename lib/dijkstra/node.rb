# Node class to represent Graph's interest points, also called 'Vertex'
#
class Dijkstra::Node
  def paths
    @paths ||= []
  end

  def reset_distance_label
    @distance_label = nil
  end
end
