require 'spec_helper'

describe Dijkstra::Node do
  it 'is defined' do
    expect(Dijkstra::Node).to be
  end

  it 'start with a default distance label of Infinity' do
    expect(subject.distance_label).to eq Dijkstra::Infinity
  end

  describe '#measure_neighbours_distance' do
    context 'node with three neighbours' do
      let(:neighbour_1) { Dijkstra::Node.new }
      let(:neighbour_2) { Dijkstra::Node.new }
      let(:neighbour_3) { Dijkstra::Node.new }

      let(:node) do
        Dijkstra::Node.new.tap do |local|
          local.paths.push Dijkstra::Path.new(local, neighbour_1, 2)
          local.paths.push Dijkstra::Path.new(local, neighbour_2, 4)
          local.paths.push Dijkstra::Path.new(local, neighbour_3, 5)
          local.distance_label = 0
        end
      end

      before { node.measure_neighbours_distance }

      it 'sets neighbour_1.distance_label to 2' do
        expect(neighbour_1.distance_label).to be 2
      end

      it 'sets neighbour_2.distance_label to 4' do
        expect(neighbour_2.distance_label).to be 4
      end

      it 'sets neighbour_3.distance_label to 5' do
        expect(neighbour_3.distance_label).to be 5
      end
    end
  end

  describe '#neighbours' do
    context 'node with three neighbours' do
      let(:neighbour_1) { Dijkstra::Node.new }
      let(:neighbour_2) { Dijkstra::Node.new }
      let(:neighbour_3) { Dijkstra::Node.new }

      let(:node) do
        Dijkstra::Node.new.tap do |node|
          node.paths.push Dijkstra::Path.new(node, neighbour_1, 2)
          node.paths.push Dijkstra::Path.new(node, neighbour_2, 4)
          node.paths.push Dijkstra::Path.new(node, neighbour_3, 5)
        end
      end

      it 'returns three nodes' do
        expect(node.neighbours.length).to eq 3
      end

      it 'returns neighbour_1 at index 0' do
        expect(node.neighbours[0]).to be neighbour_1
      end

      it 'returns neighbour_3 at index 2' do
        expect(node.neighbours[2]).to be neighbour_3
      end

      it 'sets the path required to get to a neighbour to the neighbour' do
        expect(node.neighbours[0].path.distance).to eq 2
      end
    end
  end

  describe '#set_label' do
    context 'current distance_label is Infinity, want to label it 5' do
      let(:node) { Dijkstra::Node.new }
      let(:visitor) { Dijkstra::Node.new }

      before { node.set_distance_label(visitor, 5) }

      it 'sets node.distance_label to 5' do
        expect(node.distance_label).to eq 5
      end

      it 'sets node.previous_node to be "visitor"' do
        expect(node.previous_node).to be visitor
      end
    end
  end
end
