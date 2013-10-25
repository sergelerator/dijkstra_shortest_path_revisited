require 'spec_helper'

describe Dijkstra::Graph do
  it 'is defined' do
    expect(Dijkstra::Graph).to be
  end

  let(:default_example) do
    Dijkstra::Graph.new.tap do |graph|
      graph.nodes.push(*[node_0, node_1, node_2, node_3, node_4, node_5])
      graph.link_nodes(node_0, node_1, distance: 7)
      graph.link_nodes(node_0, node_2, distance: 9)
      graph.link_nodes(node_0, node_5, distance: 14)
      graph.link_nodes(node_1, node_2, distance: 10)
      graph.link_nodes(node_2, node_5, distance: 2)
      graph.link_nodes(node_2, node_3, distance: 11)
      graph.link_nodes(node_3, node_4, distance: 6)
      graph.link_nodes(node_4, node_5, distance: 9)
    end
  end

  let(:node_0) { Dijkstra::Node.new }
  let(:node_1) { Dijkstra::Node.new }
  let(:node_2) { Dijkstra::Node.new }
  let(:node_3) { Dijkstra::Node.new }
  let(:node_4) { Dijkstra::Node.new }
  let(:node_5) { Dijkstra::Node.new }

  describe '#nodes' do
    context 'default example' do
      it 'returns six nodes' do
        expect(default_example.nodes.length).to eq 6
      end

      it 'returns node_0 at index 0' do
        expect(default_example.nodes[0]).to eq node_0
      end
    end
  end

  describe '#shortest_path' do
    context 'default example' do
      xit 'returns the shortest path from source to destination' do
        expect(default_example.shortest_path[0]).to eq node_0
      end
    end
  end
end
