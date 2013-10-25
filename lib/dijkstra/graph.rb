# Graph class to represent the data structure
#
class Dijkstra::Graph
  def link_nodes(a, b, options)
    distance = options[:distance] || fail('Specify a distance')
    paths.push(new_path = Dijkstra::Path.new(a, b, distance))
    a.paths.push new_path
    b.paths.push new_path
  end

  def measure_distance_from(source)
    reset_distance_labels
  end

  def nodes
    @nodes ||= []
  end

  def paths
    @paths ||= []
  end

  def reset_distance_labels
    nodes.each(&:reset_distance_label)
  end
end
