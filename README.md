# Dijkstra shortest path - Revisited

Coding exam at Crowd Interactive

## Usage

  Run `rake` to run all the tests.

### CLI

In order to use the CLI open up your terminal and run

    ruby dijkstra.rb

You will be prompted to set the number of nodes in the graph:

    Created a graph object. How many nodes do you want it to have?

Enter the number of nodes to go on to the next step. Here you can enter
some comands. The most useful thing to do now would be to link the
nodes. To do so, use the `l` command (for `link`) like this:

    >> l 0 1 7

The first argument is the index (or label) of the first node. Nodes are
zero-indexed, so if you entered, for example, 6 nodes, you will have
node indexes from 0 to 5 available for linking.

Once you finish linking your nodes, you can start asking for the
shortest path between pairs of nodes with the `find` command, like this:

    >> find 0 4

You will get back something like:

    Shortest path: [0, 2, 5, 4]

Once you're done, you can finish your program by typing `exit`, like
this:

    >> exit

And that's it.

### Beware

This is a work in progress and any 'undesired' input my and will make
the program crash!
