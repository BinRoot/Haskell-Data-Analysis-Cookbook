# Chapter 6
Chapter 6, **Graph Fundamentals**, manifests rudimentary algorithms for graphical networks such as **graph traversals**, **visualization**, and **maximal clique detection**.

This is the accompanying source code for [Haskell Data Analysis Cookbook](http://haskelldata.com).
Refer to the book for step-by-step explanations.

<p align="center"><a href="http://haskelldata.com" target="_blank"><img src="http://haskelldata.com/images/ch06.png"/></a></p>

# Recipes:
* **Code01**: Representing a graph from a list of edges
* **Code02**: Representing a graph from an adjacency list
* **Code03**: Conducting a topological sort on a graph
* **Code04**: Traversing a graph depth-first
* **Code05**: Traversing a graph breadth-first
* **Code06**: Visualizing a graph using Graphviz
* **Code07**: Using Directed Acyclic Word Graphs
* **Code08**: Working with hexagonal and square grid networks
* **Code09**: Finding maximal cliques in a graph
* **Code10**: Determining whether any two graphs are isomorphic

# How to use
### Setting up the environment
Install the [Haskell Platform](http://www.haskell.org/platform/).

    $ sudo apt-get install haskell-platform

Alternatively, install GHC 7.6 (or above) and Cabal.

    $ sudo apt-get install ghc cabal-install

### Running the code
A `Makefile` is provided in each recipe. Compile the corresponding executable by running `make`.

    $ make

Run the resulting code. For example,

    $ ./Code01

To clean up the directory:

    $ make clean
