require './lib/dijkstra'

# CLI for interacting with the Graph
class CLI
  def self.command_list
    @command_list ||= {
    }
  end

  def execute(command, arguments)
    method(command_list[command]).call(*arguments)
  end

  def self.prompt
    puts "What now? (type 'h' for a list of available commands)"
    until command == 'exit'
      command = gets.split(' ')
      execute(command.unshift, command)
    end
  end

  def self.run
    @graph = Dijkstra::Graph.new
    puts 'Created a graph object. How many nodes do you want it to have? '
    @node_quantity = gets.to_i
    @node_quantity.times { graph.nodes.push Dijkstra::Node.new }
    puts "Created #{node_quantity} nodes within the graph."
    prompt
  end

  def self.show_help
    puts 'h - Show the help'
    puts 'n - Show the nodes'
    puts 'p - Show the paths'
  end
end

CLI.run if $PROGRAM_NAME == __FILE__
