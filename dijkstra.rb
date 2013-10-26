$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require './lib/dijkstra'

Dijkstra::CLI.run
