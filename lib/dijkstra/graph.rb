# Graph class to represent the data structure
#
class Dijkstra::Graph
  def link_nodes(a, b, options)
    distance = options[:distance] || fail('Specify a distance')
    paths.push(new_path = Dijkstra::Path.new(a, b, distance))
    a.paths.push new_path
    b.paths.push new_path
  end

  def measure_distance_labels_from(source)
    reset_distance_labels
    source.distance_label = 0
    ordered_set = nodes.clone

    until ordered_set.empty?
      ordered_set.sort_by! { |e| e.distance_label }
      next_node = ordered_set.shift
      next_node.measure_neighbours_distance
    end
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

  def shortest_path(options)
    source = options[:from]
    destination = options[:to]

    measure_distance_labels_from(source)
    (path = []).push destination
    path.unshift path.first.previous_node until path.first.previous_node.nil?
    path
  end
end
