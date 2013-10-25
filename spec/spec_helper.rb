require 'simplecov'

SimpleCov.start

RSpec.configure do |config|
  config.color = true
end

require './lib/dijkstra'
