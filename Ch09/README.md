# Chapter 9
Chapter 9, **Parallel and Concurrent Design**, introduces advance topics in Haskell such as **forking IO actions**, **mapping over lists in parallel**, and **benchmarking performance**.

This is the accompanying source code for [Haskell Data Analysis Cookbook](http://haskelldata.com).
Refer to the book for step-by-step explanations.

<p align="center"><a href="http://haskelldata.com" target="_blank"><img src="http://haskelldata.com/images/ch09.png"/></a></p>

# Recipes:
* **Code00**: Using the Haskell Runtime System (RTS) options
* **Code01**: Evaluating a procedure in parallel
* **Code02**: Controlling parallel algorithms in sequence
* **Code03**: Forking I/O actions for concurrency
* **Code04**: Communicating with a forked I/O action
* **Code05**: Killing forked threads
* **Code06**: Parallelizing pure functions using the Par monad
* **Code07**: Mapping over a list in parallel
* **Code08**: Accessing tuple elements in parallel
* **Code09**: Implementing MapReduce to count word frequencies
* **Code10**: Manipulating images in parallel using Repa
* **Code11**: Benchmarking runtime performance in Haskell
* **Code12**: Using the criterion package to measure performance
* **Code13**: Benchmarking runtime performance in the terminal

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
