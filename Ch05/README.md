# Chapter 5
Chapter 5, **A Dance with Trees**, establishes an understanding of the tree data structure through examples including **tree traversals**, **balancing trees**, and **Huffman coding**.

This is the accompanying source code for [Haskell Data Analysis Cookbook](http://haskelldata.com).
Refer to the book for step-by-step explanations.

<p align="center"><a href="http://haskelldata.com" target="_blank"><img src="http://haskelldata.com/images/ch05.png"/></a></p>

# Recipes:
* **Code01**: Defining a binary tree data type
* **Code02**: Defining a rose tree (multiway tree) data type
* **Code03**: Traversing a tree depth-first
* **Code04**: Traversing a tree breadth-first
* **Code05**: Implementing a Foldable instance for a tree
* **Code06**: Calculating the height of a tree
* **Code07**: Implementing a binary search tree data structure
* **Code08**: Verifying the order property of a binary search tree
* **Code09**: Using a self-balancing tree
* **Code10**: Implementing a min-heap data structure
* **Code11**: Encoding a string using a Huffman tree
* **Code12**: Decoding a Huffman code

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
