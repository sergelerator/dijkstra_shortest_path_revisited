# CLI for interacting with the Graph
class Dijkstra::CLI
  class << self
    attr_reader :current_command, :graph
  end

  def self.command_list
    @command_list ||= {
      find: :find,
      h:    :show_help,
      l:    :link_nodes,
      n:    :show_nodes,
      p:    :show_paths
    }
  end

  def self.current_command
    @current_command ||= []
  end

  def self.execute(command, arguments)
    method_name = command_list[command.to_sym]
    method(method_name).call(*arguments) unless command == 'exit'
  end

  def self.find(source = nil, destination = nil)
    source && destination || (return invalid_find)
    s_node, d_node = graph.nodes[source.to_i], graph.nodes[destination.to_i]
    path = graph.shortest_path from: s_node, to: d_node
    puts "Shortest path: [#{path.map(&:label).join ', '}]"
  end

  def self.link_nodes(right = nil, left = nil, distance = nil)
    left && right && distance || (return invalid_link)
    left_node, right_node = graph.nodes[left.to_i], graph.nodes[right.to_i]
    graph.link_nodes(left_node, right_node, distance: distance.to_i)
    print "Linked node #{left} with #{right}. "
    puts  "Path's distance: #{distance}"
  end

  def self.prompt
    puts "What now? (type 'h' for a list of available commands)"
    until current_command.first == 'exit'
      print '>> '
      @current_command = gets.split(' ')
      execute(current_command.first, current_command[1..-1])
    end
  end

  def self.run
    @graph = Dijkstra::Graph.new
    puts 'Created a graph object. How many nodes do you want it to have? '
    @node_quantity = gets.to_i
    @node_quantity.times do |i|
      @graph.nodes.push Dijkstra::Node.new.tap { |node| node.label = i }
    end
    puts "Created #{@node_quantity} nodes within the graph."
    prompt
  end

  def self.show_help
    puts 'h     - Show the help'
    puts 'n     - Show the number of nodes'
    puts 'p     - Show the paths'
    puts 'exit  - Quit the program'
  end

  def self.show_nodes
    puts graph.nodes.length
  end

  def self.invalid_find
    puts 'Find needs to know the source and destination nodes'
  end

  def self.invalid_link
    puts('Link needs to know the source and destination nodes,' +
         ' as well as the distance between them')
  end
end
