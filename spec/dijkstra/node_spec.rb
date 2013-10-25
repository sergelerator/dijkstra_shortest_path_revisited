require 'spec_helper'

describe Dijkstra::Node do
  it 'is defined' do
    expect(Dijkstra::Node).to be
  end

  it 'start with a default distance label of Infinity' do
    expect(subject.distance_label).to eq Dijkstra::Infinity
  end
end
