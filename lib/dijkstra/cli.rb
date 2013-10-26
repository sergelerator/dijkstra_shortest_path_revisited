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

  def self.find(source, destination)
    path = graph.shortest_path from: source, to: destination
    puts "Shortest path: [#{path.join ', '}]"
  end

  def self.link_nodes(index_left, index_right, distance)
    left_node, right_node = graph.nodes[index_left], graph.nodes[index_right]
    graph.link_nodes(left_node, right_node, distance)
    print "Linked node #{index_left} with #{index_right}."
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
    @node_quantity.times { @graph.nodes.push Dijkstra::Node.new }
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
end
